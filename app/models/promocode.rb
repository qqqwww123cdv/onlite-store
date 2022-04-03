class Promocode < ApplicationRecord
  has_many :order

  validates :code, presence: true, length: {minimum: 4, maximum: 4}
  validates :discount, presence: true, length: {minimum: 1, maximum: 100}
end
