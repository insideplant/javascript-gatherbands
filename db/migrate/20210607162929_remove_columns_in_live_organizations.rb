class RemoveColumnsInLiveOrganizations < ActiveRecord::Migration[5.2]
  def change
    remove_column :live_organizations, :live_name, :string
    remove_column :live_organizations, :lecture_at, :date
    remove_column :live_organizations, :integer, :integer
    remove_column :live_organizations, :amount, :integer
    remove_column :live_organizations, :introduction, :text
    remove_column :live_organizations, :organize_introduction, :text
    add_column :live_organizations, :host, :boolean, default: false, null: false
  end
end
