class Api::ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    def showRoute
        begin
            print "Start <==> #{params[:startLatLong]} and End <==> #{params[:destinationLatLong]}"
            @route = Route.find(1)  #Hard Coded For now. Change this Immedaitley.
            path = BusstopNode.findRoute(params[:startLatLong].to_i, params[:destinationLatLong].to_i)

            

            if not path == false
                busstops = path.collect(&:busstop)
                # @route.routeDistance = path.last.distance
                render :json => 
                {
                    :status => "OK",
                    :route => @route,
                    :busstops => busstops

                }
            else
                render :json => { status: "Data Invalid For Algorithm. Returned False" }
            end
            
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

    def busStopData
        allbusStops = Busstop.find(:all, :select => '\'busStopName\', \'id\')  
        render :json => {:status => 'OK', busstops: allbusStops.to_json}
    end
end
