class AddIndexForUsernameToAdmin < ActiveRecord::Migration
  def up
  	add_index :admins, :userName, unique: true
  end
  def down
  	remove_index :admins, :userName, unique: true
  end
end
