
module Distance
    
    attr_reader :id, :distance, :latitude, :longitude
    attr_writer :id, :distance, :latitude, :longitude

    def createObject
        @distance = 0.0
        @latitude = 0.0
        @longitude = 0.0
    end


    def calculateDistance(latlong1, latlong2)

        placeOneCoord = Array.new
        placeTwoCoord = Array.new

        firstPlace = Busstop.new
        secondPlace = Busstop.new

        firstPlace.createObject
        secondPlace.createObject

        placeOneCoord = latlong1.split(",")
        placeTwoCoord = latlong2.split(",")

        if placeOneCoord.size == 2 and placeTwoCoord.size == 2
            firstPlace.latitude = placeOneCoord[0].to_f
            firstPlace.longitude = placeOneCoord[1].to_f

            secondPlace.latitude = placeTwoCoord[0].to_f
            secondPlace.longitude  = placeTwoCoord[1].to_f
        end

        deltaLatitude = 0.0
        deltaLongitude = 0.0
        a = 0.0
        b = 0.0
        
        #print secondPlace.latitude.class

        deltaLatitude = (secondPlace.latitude * Math::PI / 180) - (firstPlace.latitude * Math::PI / 180)
        deltaLongitude = (secondPlace.longitude * Math::PI / 180) - (firstPlace.longitude * Math::PI / 180)

        a = (Math.sin(deltaLatitude / 2) ** 2) + (Math.cos(firstPlace.latitude) * Math.cos(secondPlace.latitude) * (Math.sin(deltaLongitude / 2) ** 2) )
        b = (2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)));
        #print b * 6371
        return b * 6371
    end
end
#calculateDistance("31.5252389,74.2835783","31.5318993,74.2871527")