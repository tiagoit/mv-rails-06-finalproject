require 'test_helper'

class FriendshipTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @friend = users(:two)
  end

  test 'valid friendship request' do
    request = Friendship.new(user_id: @user.id, friend_id: @friend.id)
    assert request.valid?
  end

  test 'invalid friendship request' do
    request = Friendship.new(friend_id: @friend.id)
    assert_not request.valid?
    request = Friendship.new(user_id: @user.id)
    assert_not request.valid?
  end
end
