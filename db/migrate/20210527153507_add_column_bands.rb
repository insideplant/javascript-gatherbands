class AddColumnBands < ActiveRecord::Migration[5.2]
  def change
    add_column :bands, :image_id, :string
  end
end
