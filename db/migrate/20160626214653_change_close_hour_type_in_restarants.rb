class ChangeCloseHourTypeInRestarants < ActiveRecord::Migration
  def change
    change_column :restaurants, :close_hour, :time
  end
end
