class TableRoutesRenameColumn < ActiveRecord::Migration
  def up
    remove_column :routes, :routeSourceLatlong
    add_column :routes, :routeSourceLatLong, :string
  end
  
  def down
    add_column :routes, :routeSourceLatlong, :string
    remove_column :routes, :routeSourceLatLong
  end
end
