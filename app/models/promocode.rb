class Promocode < ApplicationRecord
  has_many :order

  validates :code, presence: true, length: {minimum: 4, maximum: 4}
  validates :discount, presence: true, length: {minimum: 1, maximum: 3}
  validate :force_negative

  private

  def force_negative
    unless discount.blank?
      if discount < 1 || discount > 100
        errors.add(:discount, "Must be greater than 0 or less then 100")
      end
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |promocode|
        csv << promocode.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Promocode.create! row.to_hash
    end
  end
end
