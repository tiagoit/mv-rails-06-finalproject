class Post < ApplicationRecord
  # relations
  belongs_to :user

  has_many :likes
  has_many :users, through: :likes

  has_many :comments

  # validations
  validates :content, presence: true
end
