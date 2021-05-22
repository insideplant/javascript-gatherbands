class RemoveBandNameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :band_name, :string
  end
end
