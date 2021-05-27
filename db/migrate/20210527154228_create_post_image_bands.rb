class CreatePostImageBands < ActiveRecord::Migration[5.2]
  def change
    create_table :post_image_bands do |t|
      t.string :image_id
      t.integer :band_id

      t.timestamps
    end
  end
end
