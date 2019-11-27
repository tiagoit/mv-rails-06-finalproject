class PostsController < ApplicationController
  def index
    @posts = Post.where(user_id: current_user.id)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'Post created.'
      redirect_to posts_path
    else
      flash[:danger] = 'Something went wrong, please try again.'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end


