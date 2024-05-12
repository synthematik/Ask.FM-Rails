class SessionsController < ApplicationController
  def new
  end

  def create
    user_params = params.require(:session)

    user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])

    if user.present?
      session[:user_id] = user.id

      redirect_to root_path, notice: 'Вход выполнен'
    else
      flash.now[:notice] = 'Неправильный email или пароль'

      render :new
    end
  end

  def destroy
    session.delete(:user_id)

    redirect_to root_path
  end
end
