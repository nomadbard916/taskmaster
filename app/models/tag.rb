class Tag < ApplicationRecord
  validates :content,  length: {maximum: 16}, presence: true
  
  

  belongs_to :task
  # belongs_to :user
end
