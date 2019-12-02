class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  # ralations
  has_many :posts

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post

  has_many :comments

  # validations
  validates :name, presence: true, length: { maximum: 50 }
end
