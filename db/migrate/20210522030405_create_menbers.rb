class CreateMenbers < ActiveRecord::Migration[5.2]
  def change
    create_table :menbers do |t|
      t.string :name
      t.string :role
      t.integer :band_id

      t.timestamps
    end
  end
end
