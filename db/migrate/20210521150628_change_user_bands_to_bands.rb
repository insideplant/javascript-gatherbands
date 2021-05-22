class ChangeUserBandsToBands < ActiveRecord::Migration[5.2]
  def change
    rename_table :user_bands, :bands
  end
end
