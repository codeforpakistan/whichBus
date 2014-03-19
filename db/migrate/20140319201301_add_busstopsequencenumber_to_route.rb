class AddBusstopsequencenumberToRoute < ActiveRecord::Migration
  def up
  	remove_column :route_busstops, :busStopSequenceNumber
  	add_column :route_busstops, :bus_stop_sequence_number, :integer
  end

  def down
  	add_column :route_busstops, :busStopSequenceNumber, :integer
  	remove_column :route_busstops, :bus_stop_sequence_number
  end
end
