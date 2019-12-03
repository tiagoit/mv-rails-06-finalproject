module LikesHelper
  def likes_count(post)
    post.likes.size
  end
end
