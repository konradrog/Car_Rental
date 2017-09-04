class Car < ApplicationRecord
  has_many :reservations
  has_many :opinions, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :brand, presence: true
  validates :model, presence: true
  validates :year, presence: true
  validates :price, presence: true, numericality: {greather_than: 0 }
  validates :description, presence: true
  validates :image, presence: true

  # def for_rent
  #   Car.where(from_date.)
  # end
end
