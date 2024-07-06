class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(
      user_params
    )

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id), notice: 'Регистрация прошла успешно'
    else
      flash.now[:notice] = 'Вы неправильно заполнили поля формы регистрации'
      render :new
    end

  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    @current_user = current_user
    @user_questions = Question.where('user_id = ?', @user.id).all_current
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "Профиль обновлен"
    else
      render :edit
    end
  end
  1
  def edit
    @user = current_user
  end

  def destroy
    @user = current_user
    @user.destroy

    session.delete(:user_id)

    redirect_to root_path, notice: 'Профиль удалён'
  end

  private
  def user_params
    params.require(:user).permit(:name, :nickname, :email, :password, :avatar)
  end
end
