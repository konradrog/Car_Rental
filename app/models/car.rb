class Car < ApplicationRecord
  has_many :reservations
  has_many :opinions

  mount_uploader :image, ImageUploader
end
