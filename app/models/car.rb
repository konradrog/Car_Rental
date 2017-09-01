class Car < ApplicationRecord
  has_many :reservations
  has_many :opinions
end
