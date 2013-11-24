class AddColumnBusStopSequenceNumber < ActiveRecord::Migration
  def up
    add_column :route_busstops, :busStopSequenceNumber, :integer 
  end
  
  def down
      remove_column :route_busstops, :busStopSequenceNumber
  end
end
