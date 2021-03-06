class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: %i[facebook]

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
    friendships.map(&:friend_id) & inverse_friendships.map(&:user_id)
  end

  # Requests made TO current_user
  def pending_acceptance
    inverse_friendships.map(&:user_id) - friendships.map(&:friend_id)
  end

  # Requests made BY current_user
  def pending_friend_acceptance
    friendships.map(&:friend_id) - inverse_friendships.map(&:user_id)
  end

  def request_friendship(friend_id)
    friendships.build(friend_id: friend_id).save
  end

  def accept_friendship(user_id)
    request_friendship(user_id)
  end

  def friend?(user_id)
    friends.include?(user_id)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.image = auth.info.image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if (data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"])
        user.email = data["email"] if user.email.blank?
      end
    end
  end
end
