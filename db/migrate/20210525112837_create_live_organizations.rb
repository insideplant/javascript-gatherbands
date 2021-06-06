class CreateLiveOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :live_organizations do |t|
      t.integer :band_id
      t.integer :live_id
      t.string :live_name
      t.date :lecture_at
      t.integer :amount, :integer
      t.text :organize_introduction
      t.timestamps
    end
  end
end
