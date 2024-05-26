require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question = questions(:one)
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "body should be present" do
    @question.body = "     "
    refute @question.valid?
  end

  test "user should be present" do
    @question.user = nil
    assert_not @question.valid?
  end
end
