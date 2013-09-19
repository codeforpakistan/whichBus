class BusstopController < ApplicationController
  def index
  end
  
  def new
    @busstop = Busstop.new
  end
  
  def createBusstop
    @busstops = Busstop.new(busstop_params)
    if @busstops.save
      redirect_to root_path
    else
      render 'showAll'
    end  
  end
  
  def showAll
    @busstops = Busstop.all
  end
  
  private
  def busstop_params
    
    params.require(:busstop).permit(:busStopName, :busStopLatLong, :user_id)
  end
end
