class TableRouteDeleteUserIdColumn < ActiveRecord::Migration
  def up
    remove_column :routes, :user_id
  end
  
  def down
    add_column :routes, :user_id, :integer
  end
end
