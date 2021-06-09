class CreateLiveHouses < ActiveRecord::Migration[5.2]
  def change
    create_table :live_houses do |t|
      t.integer :price
      t.string :house_name
      t.string :address
      t.string :telephone_number
      t.text :detail

      t.timestamps
    end
  end
end
