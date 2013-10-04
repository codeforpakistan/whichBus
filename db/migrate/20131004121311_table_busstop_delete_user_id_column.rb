class TableBusstopDeleteUserIdColumn < ActiveRecord::Migration
  def up
    remove_column :busstops, :user_id
  end
  
  def down
    add_column :busstops, :user_id, :integer
  end
end
