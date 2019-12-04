class FriendshipsController < ApplicationController

  def request_friendship
    if current_user.request_friendship(params[:friend_id])
      flash[:success] = 'Friendship requested!'
    else
      flash[:danger] = 'Something went wrong! :('
    end

    redirect_back fallback_location: root_path, allow_other_host: false
  end

  def accept_friendship
    if current_user.accept_friendship(params[:user_id])
      flash[:success] = "Friendship accepted!"
    else
      flash[:danger] = 'Something went wrong! :('
    end

    redirect_back fallback_location: root_path, allow_other_host: false
  end
end
