class CreateLiveHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :live_houses do |t|
      t.integer :price
      t.string :house_name
      t.string :postal_code
      t.string :address
      t.string :website
      t.float :branches, :latitude
      t.float :branches, :longitude
      t.string :telephone_number
      t.string :image_id
      t.text :detail
      t.boolean :is_active, default: false, null: false

      t.timestamps
    end
  end
end
