class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      
      t.string  :routeName
      t.decimal  :routeDistance
      t.string  :routeSourceLatlong
      t.string  :routeDestLatLong
      t.decimal  :routeTravelTime
      t.string  :user_id
      t.time    :routeStartTime
      t.time    :routeStopTime
      
      t.timestamps
    end
  end
end
