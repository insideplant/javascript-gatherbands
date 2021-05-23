class ChangeMenbersToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_table :menbers, :mem
  end
end
