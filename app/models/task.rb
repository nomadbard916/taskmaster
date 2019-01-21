class Task < ApplicationRecord
    validates :content, uniqueness: { case_sensitive: false },length: {maximum: 256 }, presence: true
    

    belongs_to :user
    has_many :tags

    
end
