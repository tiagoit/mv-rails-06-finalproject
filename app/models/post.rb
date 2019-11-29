class Post < ApplicationRecord
  # relations
  belongs_to :user
  
  # validations
  validates :content, presence: true
end
