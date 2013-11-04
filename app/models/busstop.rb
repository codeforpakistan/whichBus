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
    end
    
    
    def validateLatLong(latLong, fieldName)
          errors = Hash.new
          if(isNumeric?(latLong))
             return  errors = nil
          else
              fieldName[fieldName.keys[0]] = "Use Proper LatLong Address."
              return fieldName
          end

      end
            
    
    def isNumeric?(num)
        
       if(num =~ /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/)
           return true
        else
            return false
        end
    end

end


