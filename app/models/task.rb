class Task < ApplicationRecord
    validates :content, length: {maximum: 256 }, presence: true

    belongs_to :user

    
end
