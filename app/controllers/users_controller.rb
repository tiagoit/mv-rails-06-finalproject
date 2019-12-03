class UsersController < ApplicationController
  def index
    request = Friendship.where(user_id: current_user.id).select("friend_id")
    @users = User.where.not(id: request)
  end

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id])
    @comment = Comment.new
  end
end
