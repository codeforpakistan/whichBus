class RouteController < ApplicationController
  def index
     @routes = Route.all
  end

  def new
    @routes = Route.new
  end
  
  def showAll
    @routes = Route.all
  end
  
  def destroy
  end
  
  def edit
  end
  
  def addRoute
    
   # @routes = Route.new
    
  end
  
  def createRoute    
    
    @route = Route.new(params[:route].permit(:routeName, :routeDistance, :user_id))
    
    if @route.save
      redirect_to :action => 'addRoute'
    else
      render 'addRoute'
    end
    
  end
  
  def view
    
    @routes = Route.find(params [:id])
    
  end
  def show
  end
end
