require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get ajaxsearchusers" do
    get :ajaxsearchusers
    assert_response :success
  end

end
