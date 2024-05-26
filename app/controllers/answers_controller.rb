class AnswersController < ApplicationController
  before_action :require_login, only: [:create]

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to question_path(@question), notice: 'Ответ успешно создан.'
    else
      redirect_to question_path(@question), alert: 'Не удалось создать ответ.'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end

  def require_login
    unless current_user
      redirect_to new_session_path, alert: 'Вы должны быть авторизованы для создания ответа.'
    end
  end
end
