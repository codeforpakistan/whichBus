class TableBusstopDeleteUserIdColumn < ActiveRecord::Migration
  def up
    remove_column :busstop, :user_id
  end
  
  def down
    add_column :busstop, :user_id, :integer
end
