require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "div.card"
  end
end
