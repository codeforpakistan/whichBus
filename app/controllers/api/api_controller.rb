class Api::ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json
    def showRoute
        begin
            #Assuming we got IDs from iOS App for Now. For Testing Purpose.
            startID = params[:startPoint].to_i
            destinationID = params[:destinationPoint].to_i

            startBusstop = Busstop.find startID
            destinationBusstop = Busstop.find destinationID
            if startBusstop.routes.count > 0 and destinationBusstop.routes.count > 0
                @routes = Array.new
                print "Start <==> #{params[:startPoint]} and End <==> #{params[:destinationPoint]}"
                path = BusstopNode.findRoute(startID, destinationID)
                path = BusstopNode.findRouteFrequencyFromPath(path)
                if not path == false
                    @busstops = path.collect(&:busstop)
                    route_ids = path.collect(&:route_id)
                    route_ids = route_ids.uniq
                    route_ids.each do |routeID|
                    @routes << Route.find(routeID)
                end
                    # @route.routeDistance = path.last.distance
                    render :json => 
                    {
                        :status => "OK",
                        :response => 
                        {
                            :routes => @routes,
                            :busstops => @busstops
                        }
                    }
                else
                    render :json => 
                    {
                        status: "Failed",
                        response:
                        {
                            message: "Data Invalid For Algorithm. Returned False"
                        }
                    }
                end
            else
                render :json => 
                { 
                    status: "Failed",
                    response:
                    {
                            message: "No Routes Found for Endpoints." 
                    }
                }    
            end
        rescue ActiveRecord::RecordNotFound => e
            render :json =>
            {
                status: 'Failed',
                results: 'No Record Found'

            }
        end
    end

    def busStopData
        @allbusStops = Busstop.all 
        render :json => {:status => 'OK', busstops: @allbusStops}
    end
end
