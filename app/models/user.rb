class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :articles, dependent: :destroy
  has_secure_password
  
  validates :username, presence: true,
                       length: { minimum: 3, maximum: 50 },
                       uniqueness: true
  validates :email, presence: true, 
                    length: { maximum: 100 }, 
                    uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  before_save { self.email = email.downcase }

end