class StaticPagesController < ApplicationController
  def home
    @users = User.all
    @posts = Post.all
  end
end
