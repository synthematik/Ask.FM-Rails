class HomeController < ApplicationController
  def index
    @questions = Question.order(:updated_at).last(3)

  end
end
