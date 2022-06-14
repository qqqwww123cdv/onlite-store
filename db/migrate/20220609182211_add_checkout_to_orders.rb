class AddCheckoutToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :checkouts, :order, foreign_key: true
  end
end