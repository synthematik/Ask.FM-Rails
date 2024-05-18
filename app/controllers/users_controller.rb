class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(
      user_params
    )

    if @user.&save
      redirect_to root_path, notice: 'Регистрация прошла успешно'
    else
      render :new
    end

  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(
      user_params
    )
    redirect_to user_path(@user), notice: "Профиль обновлен"
    else
      render :edit
    end
  end
  1
  def edit
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :avatar)
  end
end
