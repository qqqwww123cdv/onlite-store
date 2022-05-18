class OrderPromocode < ApplicationRecord
belongs_to :order
belongs_to :promocode
end