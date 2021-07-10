class CreateBands < ActiveRecord::Migration[5.2]
  def change
    create_table :bands do |t|
      t.references :user, index: true
      t.string :band_name
      t.string :band_image_id
      t.timestamps
    end
  end
end
