class PromocodeOrder < ActiveRecord::Migration[6.1]
  def change
    create_join_table :order, :promocode do |t|
      t.index [:order_id, :promocode_id]
      t.index [:promocode_id, :order_id]
    end
  end
end
