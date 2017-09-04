class Reservation < ApplicationRecord
  belongs_to :car

  validates :name, presence: true
  validates :surname, presence: true
  validates :e_mail, presence: true, format: { with: /\w+@+\w+.+\w/,
    message: "invaild e-mail" }
  validates :address, presence: true
  validates :from_date, presence: true
  validates :to_date, presence: true
  validates :car_id, presence: true
  validates :phone_number, presence: true, length: { is: 9 }

  validate :to_date_be_greater_than_from_date

  def to_date_be_greater_than_from_date
    if from_date.day > to_date.day && from_date.month == to_date.month
      errors.add(:from_date, "to date must be higher than from date")
    end
  end

  # def booked
  #   car_id = Reservation.car_id
  # end
end
