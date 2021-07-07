class CreateLiveOrganizations < ActiveRecord::Migration[5.2]
  def change
    create_table :live_organizations do |t|
      t.integer :band_id
      t.integer :live_id
      t.timestamps
    end
  end
end
