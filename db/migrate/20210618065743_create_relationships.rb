class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :band, foreign_key: true
      t.references :follow, foreign_key: { to_table: :bands }

      t.timestamps

      t.index [:band_id, :follow_id], unique: true
    end
  end
end
