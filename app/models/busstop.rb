class Busstop < ActiveRecord::Base
    has_many     :route_busstops, :dependent => :restrict
    has_many     :routes, through: :route_busstops
    belongs_to   :admin


    #errors.add(:busStopName, 'heelo' )
    validates :busStopName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }
    #validates :busStopLatLong, presence: true
    validates :busStopSecName, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, :allow_blank => true

    def self.search(search)
        if search
            return Busstop.find(:all, :conditions => ['busStopName LIKE ?', "%#{search}%"])
        else
            return Busstop.find(:all)
        end
    end

    def validateAddressWithErrors(latlong)
        if not (latlong.blank?) 
            if (isNumeric?(latlong))
                return true
            else
                self.errors.add(:busStopLatLong, 'Use proper latlong')
                return false
            end
        else
            self.errors.add(:busStopLatLong, 'Can\'t be blank')
            return false
        end
            
        
        
        
        
        #if not (latlong.blank?)
         #   if (latlong.include? ',')
          #      lat, lng = latlong.split(',')
           #     lat = lat.to_f
            #    lng = lng.to_f
             #   if(lat == 0 or lng == 0)
              #      self.errors.add(:busStopLatLong, 'Use proper latlong')
               #     return false
                #else
                 #   return true
#                end
 #           else
  #              self.errors.add(:busStopLatLong, 'missing comma')
   #             return false
    #        end
     #   else
      #      self.errors.add(:busStopLatLong, 'Can\'t be blank')
       #     return false
        #end
    end
    
    
    def isNumeric?(num)
        
       if(num =~ /\d+[.]\d+[,]\d+[.]\d+/)
           return true
        else
            return false
        end
    end

end


