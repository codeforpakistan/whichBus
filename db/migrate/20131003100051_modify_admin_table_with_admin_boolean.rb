class ModifyAdminTableWithAdminBoolean < ActiveRecord::Migration
  def up
    remove_column :admins, :userType
    add_column :admins, :isAdmin, :boolean
  end
  def down
    add_column :admins, :userType, :string
    remove_column :admins, :isAdmin
  end
end
