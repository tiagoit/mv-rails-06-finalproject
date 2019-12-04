class UsersController < ApplicationController
  def index
    # request = Friendship.where(user_id: current_user.id).select(:friend_id)
    # request2 = Friendship.where(friend_id: current_user.id).select(:user_id)
    # @users = User.where.not(id: request).where.not(id: request2)

    users = User.where.not(id: current_user.id)
    @friends = users.select { |u| current_user.friends.include?(u.id) }
    @pending = users.select { |u| current_user.pending_acceptance.include?(u.id) }
    @pending_friend = users.select { |u| current_user.pending_friend_acceptance.include?(u.id) }
    @other = users.reject do |u|
      current_user.friends.include?(u.id) ||
        current_user.pending_acceptance.include?(u.id) ||
        current_user.pending_friend_acceptance.include?(u.id)
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id])
    @comment = Comment.new
  end
end
