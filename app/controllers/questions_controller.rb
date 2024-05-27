class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  before_action :set_users, only: %i[new edit update]

  def create
    @question = Question.new(
      question_params
    )

    @question.user_id = current_user.id

    if @question.save
      redirect_to @question, notice: 'Вопрос успешно создан.'
    else
      @users = User.all
      render :new
    end
  end

  def show
    @current_user = current_user
    @answers = @question.answers.includes(:user)
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

    redirect_to users_path, notice: "Вопрос удален"
  end

  def index
    @questions = Question.all_current
    @questions_form = Question.new
    @users = User.all
  end

  def new
    @question = Question.new
  end

  def edit

  end

  private
  def question_params
    params.require(:question).permit(:body)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def set_users
    @users = User.all
  end
end