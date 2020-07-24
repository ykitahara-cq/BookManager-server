require 'httpclient'

class Book < ApplicationRecord
  before_save :convert_image
  belongs_to :user

  validates :name, null: false, presence: true
  validates :price, null: false, presence: true
  validates :purchase_date, null: false, presence: true
  validates :image, null: false, presence: true

  def convert_image
    self.image = ImgurUploader.upload_image(image) if image.present?
  end
end
