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

end

/\w+@+\w+.+\w/
