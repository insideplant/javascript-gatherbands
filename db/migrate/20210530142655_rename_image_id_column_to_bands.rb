class RenameImageIdColumnToBands < ActiveRecord::Migration[5.2]
  def change
    rename_column :bands, :image_id, :band_image_id
  end
end
