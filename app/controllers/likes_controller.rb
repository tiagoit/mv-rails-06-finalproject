class LikesController < ApplicationController
  def create
    current_user.likes.build(post_id: params[:post])

    if current_user.save
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "Something went wrong :("
      redirect_to root_path
    end
  end
end
