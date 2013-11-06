class CreateBusstops < ActiveRecord::Migration
  def change
    create_table :busstops do |t|

      t.string :busStopName,        :null = false, :defaul = ""
      t.string :busStopLatLong
      t.string :busStopSecName
      t.belongs_to :admin
      
      t.timestamps
    end
  end
end
