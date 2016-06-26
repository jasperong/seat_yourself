class ChangeOpenHourTypeInRestarants < ActiveRecord::Migration
  def change
    change_column :restaurants, :open_hour, :time
  end
end
