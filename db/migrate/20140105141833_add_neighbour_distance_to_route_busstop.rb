class AddNeighbourDistanceToRouteBusstop < ActiveRecord::Migration
  def up
  	add_column :route_busstops, :nextBusStopDistance, :decimal
  end

  def down
  	remove_column :route_busstops, :nextBusStopDistance, :decimal
  end
end
