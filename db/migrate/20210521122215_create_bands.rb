class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.integer :user_id
      t.string :band_name
      t.string :bandimage_id
      t.timestamps
    end
  end
end
