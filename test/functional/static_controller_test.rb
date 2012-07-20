require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get resources" do
    get :resources
    assert_response :success
  end

end
