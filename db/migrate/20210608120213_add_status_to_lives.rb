class AddStatusToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :status, :boolean, default: false, null: false
    add_column :lives, :amount, :integer
    add_column :lives, :start_at, :datetime
    add_column :lives, :end_at, :datetime
    add_column :lives, :live_house_id, :integer
    remove_column :lives, :live_organization, :integer
    remove_column :lives, :live_date, :datetime
  end
end
