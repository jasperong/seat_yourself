class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :cuisine
      t.integer :restaurant_id

      t.timestamps null: false
    end
  end
end
