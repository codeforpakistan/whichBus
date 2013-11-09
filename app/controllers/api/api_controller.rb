class Api::ApiController < ApplicationController
    respond_to :json
    def showRoute
        begin
            @routes = Route.find(params[:id])
            @busstops = @routes.busstops
            render :json => {:routes => @busstops}
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
