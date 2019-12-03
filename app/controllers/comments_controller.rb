class CommentsController < ApplicationController
  def create
    current_user.comments.build(comment_params)

    if current_user.save
      redirect_back fallback_location: root_path
    else
      flash[:danger] = "Something went wrong :("
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
