require 'json'
class Api::ApiController < ApplicationController
    skip_before_filter :verify_authenticity_token
    respond_to :json

    def showRoute
        begin
            #Assuming we got IDs from iOS App for Now. For Testing Purpose.
            startAddress = params[:startPoint]
            destinationAddress = params[:destinationPoint]

            puts "StartPoint => #{startAddress}, DestinationPoint => #{destinationAddress}"
            
            startBusstop = geoCodeBusstops(startAddress)

            puts "StartAddress => #{startBusstop.to_yaml}"

            destinationBusstop = geoCodeBusstops(destinationAddress)

            puts "DestinationAddress => #{destinationBusstop.to_yaml}"

            if startBusstop.routes.count > 0 and destinationBusstop.routes.count > 0
                @routes = Array.new
                print "Start <==> #{params[:startPoint]} and End <==> #{params[:destinationPoint]}"
                path = BusstopNode.findRoute(startBusstop.id, destinationBusstop.id)
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
                            :busstops => path
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

    private

    def geoCodeBusstops(startPointAddress)
        startID = startPointAddress
        
        startPointUrl = "http://maps.googleapis.com/maps/api/geocode/json?address=#{startID}&sensor=false&api_key=#{ENV['GOOGLE_API_KEY']}"
        puts "Url to Hit: #{startPointUrl}"
        responseStartAddress = HTTParty.get(startPointUrl)

        puts responseStartAddress.code


        if responseStartAddress.code == 200

            jsonFormatStartAddress = ActiveSupport::JSON.decode(responseStartAddress.body)
            startPointLatLong = jsonFormatStartAddress['results'].first['geometry']['location']
            startPointLatLong = parseLatLong(startPointLatLong)

        end
        
        hashesArray = Hash.new
        @busstop = Busstop.all
        @busstop.each do |b|
            d = Distance.calculateDistance(b.busStopLatLong, startPointLatLong)
            hashesArray[b.busStopName] = d
        end
        hashesArray = hashesArray.sort_by { |key, value| value}
        puts "Printing Hashes: #{hashesArray.to_yaml}"
        puts "Closest Hash: #{hashesArray.first.last}"

        nearestBusstop = Busstop.find_by_busStopName(hashesArray.first.first) 
        puts "Nearest Busstop => #{nearestBusstop.to_yaml}"

        #render :json => {:status => "OK"}
        return nearestBusstop
    end




    def parseLatLong(latLong)
        s = "#{latLong['lat']},#{latLong['lng']}"
        puts "LatLong Created => #{s}"
        return s
    end
end
