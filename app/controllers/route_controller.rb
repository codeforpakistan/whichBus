class RouteController < ApplicationController
    before_filter :authenticate_admin!
    before_filter :authenticate_isAdmin#, :except => [:showAll, :view, :routeDetails]
    #before_filter :authenticate_company, :only => [:showAll, :view, :routeDetails], unless: :current_user_isAdmin?
    def new
        @route = Route.new
    end

    def showAll
        @routes = Route.all
    end

    def createRoute
        @route = Route.new(params[:route].permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
        if @route.save
            redirect_to :action => 'showAll'
        else
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
        begin
            @editRoute.update_attributes!(params.require(:route).permit(:routeName, :routeDistance, :routeSourceName, :routeDestName, :routeSourceLatLong, :routeDestLatLong, :routeTravelTime, :routeStartTime, :routeStopTime))
            redirect_to route_route_details_path(@editRoute.id)
        rescue => e
            flash[:alert] = "#{e}. Please fill the form correctly"
            redirect_to :back and return
        ensure
        
        end    
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
        @foundBusstops = Array.new
        @busstops = Busstop.all
        @routeBusstopRelations = RouteBusstop.where(:route_id => id)
        @route = Route.find(params[:id])
        @busstopArray = session[:busstopsIDs]
        session.delete(:busstopsIDs)
        if(@busstopArray != nil)    
            if (@busstopArray.size > 0)
                @busstopArray.each do |b|
                    @foundBusstops << Busstop.find(b)
                end   
            end
        end
    end

    def searchBusstop
      busstops = Route.search(params[:search])
      busstopsIDs = Array.new
      busstops.each do |bus|
         busstopsIDs << bus.id 
      end
      session[:busstopsIDs] = busstopsIDs
      redirect_to route_show_edit_route_path(params[:id])
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