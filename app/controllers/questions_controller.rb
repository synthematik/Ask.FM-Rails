class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]

  def create
    question = Question.create(
      question_params
    )

    redirect_to question_path(question), notice: "Вопрос создан"
  end

  def show

  end

  def update
    @question.update(
      question_params
    )

    redirect_to question_path(@question), notice: "Вопрос обновлен"
  end

  def destroy
    @question.update(
      archived_at: Time.now
    )

    redirect_to questions_path, notice: "Вопрос удален"
  end

  def index
    @questions = Question.all_current
    @questions_form = Question.new
  end

  def new
    @question = Question.new
  end

  def edit

  end

  private
  def question_params
    params.require(:question).permit(:body, :user_id)
  end

  def set_question
    @question = Question.find(params[:id])
  end
end