class Admin::Product < ApplicationRecord

  has_one_attached :image
  validate :correct_image_type
  validates :product_name, presence: true, length: {minimum: 2, maximum: 500}
  validates :vendor_code, presence: true, length: {minimum: 7, maximum: 7}
  validates :description, presence: true, length: {minimum: 1, maximum: 5000}
  validates :price, presence: true, length: {minimum: 1, maximum: 7}

  private

  def correct_image_type
    if image.attached? && !image.content_type.in?(%w(image/jpeg image/jpg image/png))
      errors.add(:image, 'must be a JPEG,JPG or PNG.')
    end
  end
end
