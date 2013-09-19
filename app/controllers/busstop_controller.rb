class BusstopController < ApplicationController
  def index
  end
  
  def addBusstop
    @busstops = Busstop.new(params(:busstop).permit(:busStopName, :busStopLatLong, :user_id))
    if @busstops.save
      redirect_to post_path
    else
      render 'showAllBusStop'
    end
      
    
  end
  
  def showAllBusStop
    @busstops = Busstop.All
  end
end
