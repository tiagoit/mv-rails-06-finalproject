class UsersController < ApplicationController
  def index
    @pending_acceptance = User.find_by(id: current_user.pending_acceptance) || []
    @pending_friend_acceptance = User.find_by(id: current_user.pending_friend_acceptance) || []

    friends_or_pending = [current_user.id] +
                         current_user.friends +
                         current_user.pending_acceptance +
                         current_user.pending_friend_acceptance

    @other = User.where.not(id: friends_or_pending) || []
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id])
    @comment = Comment.new
    users = User.where.not(id: current_user.id)
    @friends = users.select { |u| current_user.friends.include?(u.id) }
  end
end
