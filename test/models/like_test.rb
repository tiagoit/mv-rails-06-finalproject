require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = posts(:one)
  end

  test "valid like" do
    like = Like.new(user_id: @user.id, post_id: @post.id)
    assert like.valid?
  end

  test "invalid like without user" do
    like = Like.new(post_id: @post.id)
    assert_not like.valid?
  end

  test "invalid like without post" do
    like = Like.new(user_id: @user.id)
    assert_not like.valid?
  end
end
