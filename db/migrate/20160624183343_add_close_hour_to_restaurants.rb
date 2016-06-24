class AddCloseHourToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :close_hour, :integer
  end
end
