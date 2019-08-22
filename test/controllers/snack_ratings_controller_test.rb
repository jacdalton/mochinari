require 'test_helper'

class SnackRatingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get snack_ratings_show_url
    assert_response :success
  end

  test "should get new" do
    get snack_ratings_new_url
    assert_response :success
  end

  test "should get create" do
    get snack_ratings_create_url
    assert_response :success
  end

end
