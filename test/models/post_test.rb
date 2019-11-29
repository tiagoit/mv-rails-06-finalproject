require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test "valid post" do
    post = Post.new(content: "My post", user_id: @user.id)
    assert post.valid?
  end

  test "invalid post without content" do
    post = Post.new(content: "", user_id: @user.id)
    assert_not post.valid?
  end

  test "invalid post without user" do
    post = Post.new(content: "My post")
    assert_not post.valid?
  end
end
