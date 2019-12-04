require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    login_as @user_one = users(:one)
    @user_two = users(:four)
  end

  test 'should create and accept a new friend request' do
    # create
    assert_difference 'Friendship.count', 1 do
      post friendship_request_path(@user_two.id)
    end

    # accept
    logout
    login_as @user_two

    post friendship_accept_path(@user_one.id)
    assert flash[:success].eql? "Friendship accepted!"
  end
end
