class TableRouteBusstopAddIndexUnique < ActiveRecord::Migration
  def up
    add_index :route_busstops, [:route_id, :busstop_id], unique: true
  end
  
  def down
    
  end
end
