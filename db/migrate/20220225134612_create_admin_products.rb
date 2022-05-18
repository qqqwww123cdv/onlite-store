class CreateAdminProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :admin_products do |t|
      t.string :product_name
      t.text :vendor_code
      t.decimal :price
      t.text :description

      t.timestamps
    end
    add_index :admin_products, :product_name
    add_index :admin_products, :vendor_code
    add_index :admin_products, :price
  end
end
