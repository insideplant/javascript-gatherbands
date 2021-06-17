class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :band_id
      t.integer :article_id

      t.timestamps
    end
  end
end