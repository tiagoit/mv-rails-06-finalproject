require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    user = User.new(name: "User test", email: "email@example.org", password: "password", password_confirmation: "password")
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
    user = User.new(name: "User test", email: "email@example.org", password: "password2", password_confirmation: "password")
    assert_not user.valid?
    user = User.new(name: "User test", email: "email@example.org", password: "password", password_confirmation: "password2")
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
end
