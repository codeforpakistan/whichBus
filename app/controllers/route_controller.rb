class RouteController < ApplicationController
    before_filter :authenticate_admin!
    before_filter :authenticate_isAdmin#, :except => [:showAll, :view, :routeDetails]
    #before_filter :authenticate_company, :only => [:showAll, :view, :routeDetails], unless: :current_user_isAdmin?
    def new

    end

    def showAll
        @routes = Route.all
    end

    def createRoute
        @route = Route.new(params[:route].permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
        if @route.save
            redirect_to :action => 'showAll'
        else
            @errors = @route.errors
            render 'new'
        end 
    end

    def view   
        @routes = Route.find(params[:id])   
    end

    def editRouteProperties
        #action to show route edit page
        # 
        @editRoute = Route.find(params[:id])
    end
    
    def update
        @editRoute = Route.find(params[:id])
        @editRoute.update_attributes!(params.require(:route).permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
        redirect_to route_route_details_path(@editRoute.id)

        #  if(@editRoute.save?)
        #   redirect_to route_view_path(:id)
    end

    def destroy
        @routes = Route.find(params[:id])

        if @routes.destroy
            redirect_to route_showAll_path
        end
    end

    def routeDetails
        @route = Route.find(params[:id])
        routeBus = RouteBusstop.where(:route_id => @route.id)
        busstopIDs = Array.new
        routeBus.each do |r|
            busstopIDs << r.busstop_id
        end
        stop = Busstop.new
        @busStops = []
        busstopIDs.each do |r|
            @busStops << Busstop.find(r)
        end
    end

    def showEditRoute
        id = params[:id]
        @busstops = Busstop.all
        @routeBusstopRelations = RouteBusstop.where(:route_id => id)
        @route = Route.find(params[:id])
    end

    def includeRouteBusstop
        busstop = Busstop.find(params[:busstop_id])
        route = Route.find(params[:route_id])
        route_id = params[:route_id]
        busstop_id = params[:busstop_id]
        @routeBusstopRelations = RouteBusstop.new(:route_id => route_id, :busstop_id => busstop_id)
        if(@routeBusstopRelations.save)
            flash[:notice] = "Busstop: #{busstop.busStopName} added to route: #{route.routeName}"
            redirect_to_back()
        else
            flash[:notice] = "Could not update record."
            redirect_to_back()
        end
    end

    def removeRouteBusstop
        busstop = Busstop.find(params[:busstop_id])
        route = Route.find(params[:route_id])
        route_id = params[:route_id]
        busstop_id = params[:busstop_id]
        @routeBusstopRelations = RouteBusstop.where(:route_id => route_id, :busstop_id => busstop_id)
        if(@routeBusstopRelations.destroy_all)
            flash[:notice] = "Busstop: #{busstop.busStopName} removed from route: #{route.routeName}"
            redirect_to_back()
        else
            flash[:notice] = "Could not delete record."
            redirect_to_back()
        end
    end
    
end