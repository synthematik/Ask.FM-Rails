class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(
      user_params
    )

    redirect_to root_path, notice: 'Регистрация прошла успешно'
  end

  def user_params
    params.require(:user).permit(:name, :nickname, :email)
  end
end
