class LikesController < ApplicationController
  def create
    current_user.likes.build(post_id: params[:post_id])

    if current_user.save
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "Something went wrong :("
      redirect_to root_path
    end
  end

  def destroy
    if Like.delete_by(user_id: current_user.id, post_id: params[:id])
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "Something went wrong :("
      redirect_to root_path
    end
  end
end
