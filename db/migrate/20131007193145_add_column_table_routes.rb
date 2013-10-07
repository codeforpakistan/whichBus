class AddColumnTableRoutes < ActiveRecord::Migration
  def up
    add_column :routes, :routeSourceName, :string
    add_column :routes, :routeDestName, :string 
  end
  
  def down
    remove_column :routes, :routeSourceName
    remove_column :routes, :routeDestName
  end
end
