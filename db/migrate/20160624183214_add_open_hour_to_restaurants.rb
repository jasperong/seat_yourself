class AddOpenHourToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :open_hour, :integer
  end
end
