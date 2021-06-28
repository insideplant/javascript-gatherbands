class AddColumnLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :registered_person, :boolean
  end
end
