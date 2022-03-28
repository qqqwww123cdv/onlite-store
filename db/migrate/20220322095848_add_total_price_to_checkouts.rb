class AddTotalPriceToCheckouts < ActiveRecord::Migration[6.1]
  def change
    add_column :checkouts, :total_price, :integer
  end
end
