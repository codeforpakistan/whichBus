class RouteController < ApplicationController
  before_filter :authenticate_admin!
  
  def index
     @routes = Route.all
  end

  def new
    
  end
  
  def showAll
    @routes = Route.all
  end
  
  def createRoute
    @route = Route.new(params[:route].permit(:routeName, :routeDistance, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
    if @route.save
      redirect_to :action => 'showAll'
    else
      render 'addRoute'
    end 
  end
  
  def view   
    @routes = Route.find(params[:id])   
  end
  
  def showEditRoute
    #action to show route edit page
    # 
    @editRoute = Route.find(params[:id])
  end
  def update
    @editRoute = Route.find(params[:id])
    @editRoute.update_attributes!(params.require(:route).permit(:routeName, :routeDistance, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
    redirect_to route_view_path(@editRoute.id)
    
  #  if(@editRoute.save?)
   #   redirect_to route_view_path(:id)
  end
  
  def destroy
    @routes = Route.find(params[:id])
    
    if @routes.destroy
      redirect_to route_showAll_path
    end
  end
end