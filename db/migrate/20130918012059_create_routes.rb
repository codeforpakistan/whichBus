class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      
      t.string  :routeName
      t.decimal  :routeDistance
      t.string  :routeSourceLatLong
      t.string  :routeDestLatLong 
      t.decimal  :routeTravelTime
      t.time    :routeStartTime
      t.time    :routeStopTime
      t.belongs_to :admin
      
      t.timestamps
    end
  end
end
