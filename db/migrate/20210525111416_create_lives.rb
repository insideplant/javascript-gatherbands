class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.string :live_name
      t.text :introduction
      t.integer :amount
      t.datetime :start_at
      t.datetime :end_at
      t.string :color
      t.integer :live_house_id
      t.string :live_image_id
      t.integer :status, default: 0
      t.boolean :registered_person

      t.timestamps
    end
  end
end
