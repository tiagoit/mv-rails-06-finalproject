require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user_one = users(:one)
    @user_two = users(:two)
    @user_three = users(:three)
    @user_four = users(:four)
    @user_five = users(:five)
    @user_six = users(:six)
    @user_seven = users(:seven)
  end

  # validations  tests
  test "valid user" do
    user = User.new(name: "User test",
                    email: "email@example.org",
                    password: "password",
                    password_confirmation: "password")
    assert user.valid?
  end

  test "invalid user without name" do
    user = User.new(email: "email@example.org", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "invalid user without email" do
    user = User.new(name: "User test", password: "password", password_confirmation: "password")
    assert_not user.valid?
  end

  test "invalid user bad password" do
    user = User.new(name: "User test", email: "email@example.org", password_confirmation: "password")
    assert_not user.valid?
    user = User.new(name: "User test",
                    email: "email@example.org",
                    password: "password2",
                    password_confirmation: "password")
    assert_not user.valid?
    user = User.new(name: "User test",
                    email: "email@example.org",
                    password: "password",
                    password_confirmation: "password2")
    assert_not user.valid?
    user = User.new(name: "User test", email: "email@example.org")
    assert_not user.valid?
  end

  test "has_many posts relationship" do
    user = users(:one)
    post = user.posts.build(content: "my post")
    assert post.valid?
    assert_not_empty user.posts
    assert_not_nil user.posts
  end

  # methods tests
  test '#friends' do
    friends = @user_one.friends
    friends.each do |friend|
      assert [@user_two.id, @user_three.id].include?(friend)
    end

    friends.each do |friend|
      assert_not [@user_four.id, @user_five.id].include?(friend)
    end
  end

  test '#pending_acceptance' do
    not_pending = [@user_two.id, @user_three.id, @user_four.id]
    assert @user_one.pending_acceptance.include?(@user_five.id)
    not_pending.each do |false_req|
      assert_not @user_one.pending_acceptance.include?(false_req)
    end
  end

  test '#pending_friend_acceptance' do
    not_pending = [@user_two.id, @user_three.id, @user_four.id, @user_five.id]
    assert @user_one.pending_friend_acceptance.include?(@user_six.id)

    not_pending.each do |false_pending|
      assert_not @user_one.pending_friend_acceptance.include?(false_pending)
    end
  end

  test '#request_friendship #accept_friendship' do
    assert_not Friendship.find_by(user_id: @user_one.id, friend_id: @user_seven.id)
    @user_one.request_friendship(@user_seven.id)
    assert Friendship.find_by(user_id: @user_one.id, friend_id: @user_seven.id)
    assert_not Friendship.find_by(user_id: @user_seven.id, friend_id: @user_one.id)
    @user_seven.accept_friendship(@user_one.id)
    assert Friendship.find_by(user_id: @user_seven.id, friend_id: @user_one.id)
  end

  test '#friend?' do
    friends = [@user_two.id, @user_three.id]
    not_friends = [@user_four.id, @user_five.id, @user_six.id]

    friends.each do |friend|
      assert @user_one.friend?(friend)
    end

    not_friends.each do |not_friend|
      assert_not @user_one.friend?(not_friend)
    end
  end
end
