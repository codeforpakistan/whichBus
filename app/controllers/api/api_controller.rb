class Api::ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    def showRoute
        begin
            @route = Route.find(params[:id])
            @busstops = @route.busstops
            render :json => 
            {
                :status => "OK",
                :route => @route,
                :busstops => @busstops

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
