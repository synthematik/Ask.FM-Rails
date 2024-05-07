class HomeController < ApplicationController
  def index
    @questions = Question.all_current.sort_by(&:updated_at)
    @questions_form = Question.new
  end
end
