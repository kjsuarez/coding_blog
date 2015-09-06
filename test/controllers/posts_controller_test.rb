require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new,:admin_id => 1
    assert_response :success
  end

end
