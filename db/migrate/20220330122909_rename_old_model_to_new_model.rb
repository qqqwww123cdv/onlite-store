class RenameOldModelToNewModel < ActiveRecord::Migration[6.1]
  def change
    rename_table :order_promocode, :order_promocodes
  end
end
