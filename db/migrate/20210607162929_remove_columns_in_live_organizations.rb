class RemoveColumnsInLiveOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_column :live_organizations, :host, :boolean, default: false, null: false
  end
end
