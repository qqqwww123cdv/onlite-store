class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :order, dependent: :destroy

  validates :name, presence: true, length: {minimum: 1, maximum: 20}
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  private

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |checkout|
        csv << checkout.attributes.values_at(*column_names)
      end
    end
  end

end
