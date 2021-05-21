class CreateUserBands < ActiveRecord::Migration[5.2]
  def change
    create_table :user_bands do |t|
      t.integer :user_id
      t.string :band_name
      t.timestamps
    end
  end
end
