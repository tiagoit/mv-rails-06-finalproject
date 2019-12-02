require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    login_as @user = users(:one)
    @post = posts(:one)
    @content = "my text"
  end

  test "comment without logged user" do
    logout
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { post_id: @post.id, content: @content } }
    end
  end

  test "comment whitout content" do
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { post_id: @post.id, content: "" } }
    end
  end
  
  test "insert a new comment" do
    assert_difference 'Comment.count', 1 do
      post comments_path, params: { comment: { post_id: @post.id, content: @content } }
    end
  end
end
