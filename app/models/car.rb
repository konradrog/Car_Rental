class Car < ApplicationRecord
  has_many :reservations
  has_many :opinions

  mount_uploader :image, ImageUploader

  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :price, presence: true, numericality: {greather_than: 0 }
  validates :description, presence: true

end
