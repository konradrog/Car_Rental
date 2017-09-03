class Reservation < ApplicationRecord
  belongs_to :car

  validates :name, presence: true
  validates :surname, presence: true
  validates :e_mail, presence: true
  validates :address, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :car_id, presence: true

end
