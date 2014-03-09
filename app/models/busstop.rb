class Busstop < ActiveRecord::Base

    #include Distance
    has_many     :route_busstops, :dependent => :restrict
    has_many     :routes, through: :route_busstops
    belongs_to   :admin

    PI = 3.141592653589793


    #errors.add(:busStopName, 'heelo' )
    validates :busStopName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, length: {minimum: 3, maximum: 25}
    #validates :busStopLatLong, presence: true
    validates :busStopSecName, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, length: {minimum: 3, maximum: 25}, :allow_blank => true
    
    def self.search(search)
        if search
            Busstop.find(:all, :conditions => ["\'busStopName\' LIKE ?", "%#{search}%"])
        else
            Busstop.find(:all)
        end
    end

    def validateLatLong(fieldName = {})
        fieldErrors = Hash.new
        int = 0
        puts fieldName.size
        fieldName.each do |key, value|
            int +=1
            puts "#{int} iteration"
            if(isNumeric?(value))

            else
                fieldErrors[key] = 'Use proper \'LatLong\' address.'
            end
        end
        return fieldErrors
    end

    def isNumeric?(num)

     if(num =~ /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/)
         return true
     else
        return false
    end
end

    def searchNearByBusStops()  #search nearby busstops and print 

        centerBusStopLatLong = self.busStopLatLong
        allBusStop = Busstop.all
        nearByBusStops = Array.new
        allBusStop.each do |b|
            currentBusStopLatLong = b.busStopLatLong
            tempDistance = calculateDistance(centerBusStopLatLong,currentBusStopLatLong)
            if tempDistance <= 3.5
                neighbourBusstop = DistanceID.new
                neighbourBusstop.distance = tempDistance
                neighbourBusstop.id = b.id
                nearByBusStops << neighbourBusstop
            end
        end
        return nearByBusStops
    end

    def busstopOnWhichRoute(nearByBusstopsArray)

        
        
        # allRouteBusStopRelations = RouteBusstop.all
        # currentBusStopID = busstop.id
        # routeBusStopRelationsArray = Array.new
        # i = -1
        # routeBusStopRelationsArray = RouteBusstop.where[:busstop_id => currentBusStopID]
        # commonRouteForBusStop = Array.new
        # routeBusStopRelationsArray.each do |r|
        #     i +=1
        #     commonRouteForBusStop[i] = r.busstop_id
        # end


    end

    def testingTree
        a = Tree::TreeNode.new("1","Hello")
        b = Tree::TreeNode.new("3","World")
        c = Tree::TreeNode.new("5","SomeWhere")
        a << b
        b << c 
        a.print_tree
        return a
    end

end


