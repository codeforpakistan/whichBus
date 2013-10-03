class ModifyAdminTable < ActiveRecord::Migration
  def up
    add_column :admins, :approved, :boolean
  end
  
  def down
    remove_column :admins, :approved
  end
end
