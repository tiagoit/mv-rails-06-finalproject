class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  ##############################################################################################################
  # RELATIONS
  ##############################################################################################################
  has_many :posts

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'

  ##############################################################################################################
  # VALIDATIONS
  ##############################################################################################################
  validates :name, presence: true, length: { maximum: 50 }

  ##############################################################################################################
  # INSTANCE METHODS
  ##############################################################################################################
  def friends
    friends_array = friendships.map { |friendship| friendship.friend_id if friendship.confirmed }
    friends_array += inverse_friendships.map { |friendship| friendship.user_id if friendship.confirmed }
    friends_array.compact
  end

  # Requests made TO current_user
  def pending_acceptance
    inverse_friendships.map { |friendship| friendship.user_id unless friendship.confirmed }.compact
  end

  # Requests made BY current_user
  def pending_friend_acceptance
    friendships.map { |friendship| friendship.friend_id unless friendship.confirmed }.compact
  end

  def request_friendship(friend_id)
    friendships.build(friend_id: friend_id).save
  end

  def accept_friendship(user_id)
    friendship = inverse_friendships.find { |friendship| friendship.user_id == user_id }
    friendship.confirmed = true
    friendship.save
  end

  def friend?(user_id)
    friends.include?(user_id)
  end
end
