class UsersController < ApplicationController
  def index
    users = User.where.not(id: current_user.id)
    @pending_acceptance = users.select { |u| current_user.pending_acceptance.include?(u.id) }
    @pending_friend_acceptance = users.select { |u| current_user.pending_friend_acceptance.include?(u.id) }
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
    users = User.where.not(id: current_user.id)
    @friends = users.select { |u| current_user.friends.include?(u.id) }
  end
end
