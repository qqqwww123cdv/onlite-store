class Checkout < ApplicationRecord
  belongs_to :user

  validates :name, presence: true, length: {minimum: 1, maximum: 20}
  validates :address, presence: true, length: {minimum: 20}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }



end
