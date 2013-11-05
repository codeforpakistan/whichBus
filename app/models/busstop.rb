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

end


