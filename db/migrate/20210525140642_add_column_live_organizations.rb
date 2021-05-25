class AddColumnLiveOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :live_organizations, :live_name, :string
    add_column :live_organizations, :lecture_at, :date
    add_column :live_organizations, :amount, :integer
    add_column :live_organizations, :organize_introduction, :text
  end
end
