class AddColumnRouteBusstop < ActiveRecord::Migration
  def down
  
  add_column :route_busstops, :nextBusStop_id, :integer
  add_column :route_busstops, :overview_polyline, :string
  
  end
end
