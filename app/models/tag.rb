class Tag < ApplicationRecord
  validates :content, uniqueness: { case_sensitive: false }, length: {maximum: 16}
  
  

  belongs_to :task
end
