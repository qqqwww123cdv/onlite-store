class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :product_name, use: :slugged
  has_many :order_items, dependent: :destroy
  has_many :orders, through: :order_items
  has_one_attached :image
  belongs_to :category
  validates :category_id, presence: true
  validate :correct_image_type
  validates :product_name, presence: true, length: {minimum: 2, maximum: 500}
  validates :vendor_code, presence: true, length: {minimum: 7, maximum: 7}
  validates :description, length: {minimum: 0, maximum: 5000}
  validates :price, presence: true, length: {maximum:7}, :numericality => { :greater_than_or_equal_to => 1 }

  def can_destr?
    orders.size <= 0
  end

  private

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'must be a JPEG,JPG or PNG.')
    end
  end
end
