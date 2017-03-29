require 'test_helper'

class SetLanguageControllerTest < ActionController::TestCase
  test "should get english" do
    get :english
    assert_response :success
  end

  test "should get italian" do
    get :italian
    assert_response :success
  end

end
