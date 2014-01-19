class Api::ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    def showRoute
        begin
            @route = Route.find(1)  #Hard Coded For now. Change this Immedaitley.
            startBusstop = Busstop.find(params[:id])
            # destinationBusstop = Busstop.find(params[:destinationLatLong])
            path = BusstopNode.findRoute(1, 42)
            busstops = path.collect(&:busstop)
            @route.routeDistance = path.last.distance
            render :json => 
            {
                :status => "OK",
                :route => @route,
                :busstops => busstops

            }
        rescue ActiveRecord::RecordNotFound => e
            render :json =>
            {
                status: 'Failed',
                results: 'No Record Found'

            }
        end
    end


    def savePolyLineData
        busstopID = params[:busStopID]
        routeID = params[:routeID]
        nextBusstop = params[:nextBusStopID]
        route = Route.find(routeID)
        busStopOnRoute = RouteBusstop.where("route_id = #{routeID} AND busstop_id = #{busstopID}")
        render :json => { :status => 'OK', :route => route, :RouteBusstop => busStopOnRoute}


    end
end
