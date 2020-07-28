class User < ApplicationRecord
  has_many :books
  has_secure_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, null: false, uniqueness: true, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, null: false, presence: true, length: { minimum: 6 }
end
