class Comment < ApplicationRecord
  # relations
  belongs_to :user
  belongs_to :post
  
  # validations
  validates :content, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true
end
