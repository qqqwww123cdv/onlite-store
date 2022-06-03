class ChangeStringToBooleanOfPickup < ActiveRecord::Migration[6.1]
  def change
    change_column :checkouts, :pick_up, :boolean
  end
end
