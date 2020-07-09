class User < ApplicationRecord
  has_many :books
  has_secure_token

  validates :email, null: false, uniqueness: true, presence: true
  validates :password, null: false, presence: true, length: { minimum: 6 }
end
