require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
    @content = "my text"
  end

  test "valid comment" do
    comment = Comment.new(user_id: @user.id, post_id: @post.id, content: @content)
    assert comment.valid?
  end

  test "invalid comment without user" do
    comment = Comment.new(user_id: nil, post_id: @post.id, content: @content)
    assert_not comment.valid?
  end

  test "invalid comment without post" do
    comment = Comment.new(user_id: @user.id, post_id: nil, content: @content)
    assert_not comment.valid?
  end

  test "invalid comment without content" do
    comment = Comment.new(user_id: @user.id, post_id: @post.id, content: "")
    assert_not comment.valid?
  end
end
