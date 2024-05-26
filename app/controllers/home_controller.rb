class HomeController < ApplicationController
  def index
    @questions = Question.all_current.sort_by(&:updated_at).last(3)
    @users = User.all
  end
end
