class QuestionsController < ApplicationController
  def create
    Question.create(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
    )
  end

  def show
    @question = Question.find(params[:id])

  end

  def update
    @question = Question.find(params[:id])
    @question.update(
      body: params[:question][:body],
      user_id: params[:question][:user_id]
    )
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
  end

  def index
    @questions = Question.all
  end
end
