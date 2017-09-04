class Reservation < ApplicationRecord
  belongs_to :car

  validates :name, presence: true
  validates :surname, presence: true
  validates :e_mail, presence: true, format: { with: /\w+@+\w+.+\w/,
    message: "invaild e-mail" }
  validates :address, presence: true
  validates_date :from_date, presence: true
  validates_date :to_date, :after => :from_date, presence: true
  validates :car_id, presence: true
  validates :phone_number, presence: true, length: { is: 9 }

  validate :if_car_is_free

  def if_car_is_free
    Reservation.where(car_id: car_id).each do |el|
      if from_date.day <= el.to_date.day
        errors.add(:from_date, "choose oder dates. car is unavilible then")
      end
    end
  end

  def self.check_if_av(car_id, from_date, to_date)
    cars_to_choose = []
    Reservation.where(car_id: car_id).each do |el|
      if from_date.day >= el.to_date.day
        cars_to_choose << el
      end
    end
  end
  # validate :to_date_be_greater_than_from_date
  #
  # def to_date_be_greater_than_from_date
  #   if from_date.day > to_date.day && from_date.month == to_date.month
  #     errors.add(:from_date, "to date must be higher than from date")
  #   end
  # end

  # def booked
  #   car_id = Reservation.car_id
  # end
end
