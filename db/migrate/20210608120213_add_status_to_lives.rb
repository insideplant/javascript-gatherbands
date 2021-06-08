class AddStatusToLives < ActiveRecord::Migration[5.2]
  def change
    add_column :lives, :status, :integer
    add_column :lives, :amount, :integer
    add_column :lives, :lecture_at, :date
    remove_column :lives, :live_organization, :integer
    remove_column :lives, :live_date, :datetime
  end
end
