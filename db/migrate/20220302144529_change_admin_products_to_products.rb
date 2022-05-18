class ChangeAdminProductsToProducts < ActiveRecord::Migration[6.1]
  def change
    rename_table :admin_products, :products
  end
end
