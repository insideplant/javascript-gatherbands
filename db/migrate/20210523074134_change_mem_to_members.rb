class ChangeMemToMembers < ActiveRecord::Migration[5.2]
  def change
    rename_table :mem, :members
  end
end
