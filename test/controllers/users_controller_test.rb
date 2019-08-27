require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_bio" do
    get users_my_bio_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

end
