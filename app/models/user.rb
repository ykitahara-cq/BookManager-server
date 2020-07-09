class User < ApplicationRecord
  has_many :books
  has_secure_token

  validates :email, null: false, uniquness: true, presence: true
  validates :password, null: false, presence: true
end
