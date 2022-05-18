class CreateCheckouts < ActiveRecord::Migration[6.1]
  def change
    create_table :checkouts do |t|
      t.string :name
      t.string :email
      t.string :address
      t.string :pick_up

      t.timestamps
    end
    add_index :checkouts, :name
    add_index :checkouts, :email
  end
end
