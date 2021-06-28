class ChangeIsFlagDefaultLiveHouses < ActiveRecord::Migration[5.2]
  def change
    change_column_default :live_houses, :is_active, from: true, to: false
  end
end
