require 'test_helper'

class AuthorsControllerTest < ActionController::TestCase
  test "should get ajaxsearchauthors" do
    get :ajaxsearchauthors
    assert_response :success
  end

end
