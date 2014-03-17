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
            destinationBusstop = geoCodeBusstops(destinationAddress)
            if startBusstop != false and destinationBusstop != false
                puts "StartAddress => #{startBusstop.to_yaml}"
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
                        allBusStopOnMap = Array.new
                        singleRoute = Array.new
                        path.each do |aPoint|
                            allBusStopOnMap << aBusStopOnMap = BusstopOnMap.new(aPoint.busstop,aPoint.route_id)
                        end

                        totalBusstops = allBusStopOnMap.count
                        i = 0
                        
                        allBusStopOnMap.each_index do |index|
                            #binding.pry
                            
                            # puts "element #{allBusStopOnMap[index].route_id} index #{index}"
                            # i+=1
                            if index + 1 < totalBusstops 
                                puts "index #{index}"
                                if ! (allBusStopOnMap[index].route_id == allBusStopOnMap[index + 1].route_id) 
                                    #binding.pry
                                    aBusStop = allBusStopOnMap[index]
                                    aBusStop.next_route_id = allBusStopOnMap[index + 1].route_id
                                    singleRoute << aBusStop
                                end
                            end
                        end
                        # @route.routeDistance = path.last.distance
                        render :json => 
                        {
                            :status => "OK",
                            :response => 
                            {
                                :routes => @routes,
                                :sourceBusstop => allBusStopOnMap.first,
                                :destinationBusstop => allBusStopOnMap.last,
                                :intermediateBusstop => singleRoute,
                                :allbusStopsOnRoute => allBusStopOnMap
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
            else
                render :json => 
                { 
                    status: "Failed",
                    response:
                    {
                            message: "No Valid response from Google API." 
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
        
        startPointUrl = "https://maps.googleapis.com/maps/api/geocode/json?address=#{startID}&sensor=false&key=#{ENV['GOOGLE_API_KEY']}"
        puts "Url to Hit: #{startPointUrl}"
        responseStartAddress = HTTParty.get(startPointUrl)

        puts "Response Code From Google API: #{responseStartAddress.code}"

        binding.pry
        if responseStartAddress.code == 200
            binding.pry
            jsonFormatStartAddress = ActiveSupport::JSON.decode(responseStartAddress.body)
            if jsonFormatStartAddress['results'].count > 0
                puts "Got Some Results. #{jsonFormatStartAddress['results'].count} to be exact."
                startPointLatLong = jsonFormatStartAddress['results'].first['geometry']['location']
            binding.pry
            startPointLatLong = parseLatLong(startPointLatLong)
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

            return nearestBusstop
            end

            
        else
            return false
        end
        return false
    end

    def parseLatLong(latLong)
        s = "#{latLong['lat']},#{latLong['lng']}"
        puts "LatLong Created => #{s}"
        return s
    end
end
