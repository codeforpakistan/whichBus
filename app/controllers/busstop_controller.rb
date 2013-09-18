class BusstopController < ApplicationController
  def index
  end
  
  def addBusstop
  end
  
  def showAllBusStop
    @busstops = Busstop.All
  end
end
