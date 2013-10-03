class ReCreateColumnApproved < ActiveRecord::Migration
  def up
    remove_column :admins, :approved
    add_column :admins, :approved, :boolean, :default => false
  end
  def down
    remove_column :admins, :approved
    add_column :admins, :approved, :boolean
    
    
  end
end

