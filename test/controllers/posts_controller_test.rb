require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    sign_in users(:one)
  end

  test "should get index" do
    get posts_path
    assert_response :success
  end

  test "should get new" do
    get new_post_path
    assert_response :success
  end

  test "should create a new post and redirect to root" do
    assert_difference 'Post.count', 1 do
      post posts_path, params: { post: { content: 'Post content' } }
    end
    assert_redirected_to root_path
  end
end
