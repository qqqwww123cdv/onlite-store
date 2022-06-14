class ChangeIntegerToDecimalTotalPrice < ActiveRecord::Migration[6.1]
  def change
    change_column :checkouts, :total_price, :decimal 
  end
end
