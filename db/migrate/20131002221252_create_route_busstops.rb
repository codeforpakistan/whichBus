class CreateRouteBusstops < ActiveRecord::Migration
  def change
    create_table :route_busstops do |t|
      t.belongs_to :route
      t.belongs_to :busstop
      
      t.timestamps
    end
  end
end
