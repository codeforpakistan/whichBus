
require 'tree'
class Busstop < ActiveRecord::Base
include Distance
    has_many     :route_busstops, :dependent => :restrict
    has_many     :routes, through: :route_busstops
    belongs_to   :admin

    PI = 3.141592653589793


    #errors.add(:busStopName, 'heelo' )
    validates :busStopName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }
    #validates :busStopLatLong, presence: true
    validates :busStopSecName, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, :allow_blank => true

#    def self.search(search)
#        if search
#            return Busstop.find(:all, :conditions => ['busStopName ILIKE ?', "%#{search}%"])
            #return Busstop.find(:all, :conditions => ['lower(busStopName) LIKE ?', "%#{search.downcase}%"])
#        else
#            return Busstop.find(:all)
#        end
#    end 
    
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
    
    def searchNearByBusStops(busstop)

        centerBusStopLatLong = busstop.busStopLatLong
        allBusStop = Busstop.all
        i = -1
        nearBusStop = Array.new
        allBusStop.each do |b|
            currentBusStopLatLong = b.busStopLatLong
            b.distance = calculateDistance(centerBusStopLatLong,currentBusStopLatLong)
            
            if (b.distance < 2)
                i +=1
                nearBusStop[i] = b.busStopName
            end
            print b.busStopName
            print " "
            print b.distance
            print "        "
        end
        print " These are the Nearest BusStop"
        print nearBusStop
    end

    def busstopOnWhichRoute(busstop)
        allRouteBusStopRelations = RouteBusstop.all
        currentBusStopID = busstop.id
        
        routeBusStopRelationsArray = Array.new
        i = -1
        routeBusStopRelationsArray = RouteBusstop.where[:busstop_id => currentBusStopID]
        commonRouteForBusStop = Array.new
        routeBusStopRelationsArray.each do |r|
            i +=1
            commonRouteForBusStop[i] = r.busstop_id
        end


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


