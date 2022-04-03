class Order < ApplicationRecord

  has_many :order_items
  before_save :set_subtotal
  has_many :promocode, through: :order_promocode

  def subtotal
      order_items.collect{|order_item| order_item.valid? ? order_item.unit_price*order_item.quantity : 0}.sum
      
  end

  def applay_promocode(promocode)
    OrderPromocode.create(order_id: self.id, promocode_id: promocode.id)
    sub = (subtotal.to_f * promocode.discount.to_f) /100
    total_price = subtotal - sub
    update(total_price: total_price)
    
  end

  private

  def set_subtotal
      self[:subtotal] = subtotal
  end

end
