require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    login_as @user = users(:one)
    @post = posts(:one)
  end

  test "like without post" do
    assert_no_difference 'Like.count' do
      post likes_path, params: { post_id: nil }
    end
  end

  test "like with logged user" do
    assert_difference 'Like.count', 1 do
      post likes_path, params: { post_id: @post.id }
    end
  end

  test "delete a like" do
    assert_difference 'Like.count', 1 do
      post likes_path, params: { post_id: @post.id }
    end
    assert_difference 'Like.count', -1 do
      delete like_path(@post)
    end
  end

  test "like without logged user" do
    logout
    assert_no_difference "Like.count" do
      post likes_path, params: { post_id: @post.id }
    end
  end

  test "remove like without logged user" do
    logout
    assert_no_difference "Like.count" do
      delete like_path(@post)
    end
  end
end
