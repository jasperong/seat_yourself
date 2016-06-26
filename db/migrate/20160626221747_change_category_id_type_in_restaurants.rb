class ChangeCategoryIdTypeInRestaurants < ActiveRecord::Migration
  def change
    change_column :restaurants, :category_id, :integer
  end
end
