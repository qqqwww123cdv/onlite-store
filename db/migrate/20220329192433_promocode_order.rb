class PromocodeOrder < ActiveRecord::Migration[6.1]
  def change
    create_join_table :order, :promocode do |t|
      t.index :order
      t.index :promocode
    end
  end
end
