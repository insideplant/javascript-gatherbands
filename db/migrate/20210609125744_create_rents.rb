class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :live, index: true
      t.references :live_house, index: true

      t.timestamps
    end
  end
end
