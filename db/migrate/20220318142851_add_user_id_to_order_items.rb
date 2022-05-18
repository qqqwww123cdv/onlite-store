class AddUserIdToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :user_id, :integer
    add_index :order_items, :user_id
  end
end
