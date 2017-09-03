class Opinion < ApplicationRecord
  belongs_to :car

  validates :author, presence: true
  validates :text, presence: true, length: { maximum: 1000 }
end
