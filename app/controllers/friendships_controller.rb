class FriendshipsController < ApplicationController
  # Add friendship request from current_user to param[:user_id]
  def friendship_request
    current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)

    if current_user.save
      flash[:success] = 'Friendship requested!'
    else
      flash[:danger] = 'Something went wrong! :('
    end
    redirect_back fallback_location: root_path
  end

  def friendship_accept
    user = User.find_by(id: params[:request_id])
    request = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    
    if request.update(confirmed: true)
      flash[:success] = "Now #{user.name} is your new friend!"
    else
      flash[:danger] = 'Something went wrong! :('
    end

    redirect_back fallback_location: root_path
  end
end
