class CreateLives < ActiveRecord::Migration[5.2]
  def change
    create_table :lives do |t|
      t.datetime :live_date
      t.integer :live_organization
      t.text :introduction
      t.string :live_name

      t.timestamps
    end
  end
end
