class RouteController < ApplicationController
  def index
     @routes = Route.all
  end

  def new
    
  end
  
  def showAll
    @routes = Route.all
  end
  
  def createRoute
    @route = Route.new(params[:route].permit(:routeName, :routeDistance, :user_id))
    if @route.save
      redirect_to :action => 'showAll'
    else
      render 'addRoute'
    end 
  end
  
  def view   
    @routes = Route.find(params[:id])   
  end
  
  def destroy
    @routes = Route.find(params[:id])
    
    if @routes.destroy
      redirect_to route_showAll_path
    end
  end
end
