class CreatePromocodes < ActiveRecord::Migration[6.1]
  def change
    create_table :promocodes do |t|
      t.string :code
      t.integer :discount

      t.timestamps
    end
  end
end
