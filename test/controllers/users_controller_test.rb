require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
  end

  test "should get index" do
    get users_path
    assert_response :success
  end

  test "should show user" do
    get user_path(users(:one).id)
    assert_response :success
  end
end
