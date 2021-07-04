class AddLiveImageIdToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :live_image_id, :string
  end
end
