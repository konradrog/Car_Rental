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
      if from_date == nil || to_date == nil
        errors.add(:from_date, "choose oder dates")
      elsif from_date.day <= el.to_date.day
        errors.add(:from_date, "choose oder dates. car is unavilible then")
      end
    end
  end
end
