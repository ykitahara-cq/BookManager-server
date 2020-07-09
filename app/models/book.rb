class Book < ApplicationRecord
  belongs_to :user

  validates :name, null: false, presence: true
  validates :price, null: false, presence: true
  validates :purchase_date, null: false, presence: true
  validates :image, null: false, presence: true
end
