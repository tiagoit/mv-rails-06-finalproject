require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    login_as @user = users(:one)
    @friend = users(:four)
    @three = users(:three)
  end
  
  test 'should create a new friend request' do
    assert_difference 'Friendship.count', 1 do
      post friendship_request_path(@friend.id)
    end
  end
  
  test 'should accept a friend request' do
    assert_difference 'Friendship.count', 1 do
      post friendship_request_path(@three.id)
    end
    logout
    login_as @three
    assert_not @three.friend?(@user.id)
    post friendship_accept_path(@user.id)
    assert @three.friend?(@user.id)
  end
end
