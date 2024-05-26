require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question = questions(:one)
    @user = users(:one)
  end

  test "should get index" do
    get questions_url
    assert_response :success
  end
end
