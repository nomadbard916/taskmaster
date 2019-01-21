class User < ApplicationRecord
    # before_destroy :ensure_admin
    validates :email, :name, :password, presence: true

     VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

    has_many :tasks, dependent: :destroy
    has_many :tags, dependent: :destroy

    private
    # def ensure_admin
    #     if User.where(admin: true).count == 1
    #         return
    #     end
    # end
end
