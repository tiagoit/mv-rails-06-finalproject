module PostsHelper
  def liked(user)
    if post.likes.user_id == current_user.id
      "far fa-heart"
    else
      "fas fa-heart"
    end
  end
end