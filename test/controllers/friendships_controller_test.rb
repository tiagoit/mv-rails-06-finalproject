require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  
  def setup
    login_as @user = users(:one)
    @friend = users(:four)
    @three = users(:three)
    @request = friendships(:three)
  end
  
  test 'should create a new friend request' do
    assert_difference 'Friendship.count', 1 do
      post friendship_request_path(@friend.id)
    end
  end
end
