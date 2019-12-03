class FriendshipsController < ApplicationController
  # Add friendship request from current_user to param[:user_id]
  def friendship_request
    debugger
    current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
    if current_user.save
      flash[:success] = 'Friendship requested!'
    else
      flash[:danger] = 'Something went wrong! :('
    end
    redirect_back fallback_location: root_path
  end

  # def friendship_accept
  #   current_user
  # end
end
