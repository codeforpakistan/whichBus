class Route < ActiveRecord::Base
  has_many :route_busstops, :dependent => :destroy
  has_many :busstops, through: :route_busstops
  
  has_one :admin
  
  has_many :companies, through: :company_routes
  has_many :company_routes
  
  
  
  validates :routeName, presence: true, uniqueness: true, format: { with: /\A[\sa-z0-9]+\Z/i, message: "only allows alphanumeric" }
  validates :routeSourceName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }
  validates :routeDestName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters numbers and space" }
  validates :routeDistance, numericality: true, :allow_blank => true
  validates :routeSourceLatLong, presence: true 
  validates :routeDestLatLong, presence: true
  
  def self.search(search)
    if search
      Busstop.find(:all, :conditions => ['busStopName LIKE ?', "%#{search}%"])
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
      
     if (num =~ /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/)
         return true
      else
          return false
      end
  end
  
  
  
  #working latlong validation [+,-]?\d+[.]\d+[,]\s{0,1}[+,-]?\d+[.]\d+
  
  
end
