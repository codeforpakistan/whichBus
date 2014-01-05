
module Distance

    def self.calculateDistance(latlong1, latlong2)

        placeOneCoord = Array.new
        placeTwoCoord = Array.new

        # placeOneLreateObject
        # placeTwoLreateObject

        placeOneCoord = latlong1.split(",")
        placeTwoCoord = latlong2.split(",")

        if placeOneCoord.size == 2 and placeTwoCoord.size == 2
            placeOneLatitude = placeOneCoord[0].to_f
            placeOneLongitude = placeOneCoord[1].to_f

            placeTwoLatitude = placeTwoCoord[0].to_f
            placeTwoLongitude  = placeTwoCoord[1].to_f
        end

        deltaLatitude = 0.0
        deltaLongitude = 0.0
        a = 0.0  
        
        b = 0.0
        

        deltaLatitude = (placeTwoLatitude * Math::PI / 180) - (placeOneLatitude * Math::PI / 180)
        deltaLongitude = (placeTwoLongitude * Math::PI / 180) - (placeOneLongitude * Math::PI / 180)

        a = (Math.sin(deltaLatitude / 2) ** 2) + (Math.cos(placeOneLatitude) * Math.cos(placeTwoLatitude) * (Math.sin(deltaLongitude / 2) ** 2) )
        b = (2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a)));
        return b * 6371
    end
end
#calculateDistance("31.5252389,74.2835783","31.5318993,74.2871527")