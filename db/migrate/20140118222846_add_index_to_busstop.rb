class AddIndexToBusstop < ActiveRecord::Migration
  def up
  	add_index :busstops, :busStopName, unique: true
  	add_index :busstops, :busStopLatLong, unique: true
  end
  def down
  	remove_index :busstops, :busStopName, unique: true
  	remove_index :busstops, :busStopLatLong, unique: true
  end
end
