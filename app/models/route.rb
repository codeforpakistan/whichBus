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
      
     if(num =~ /\d+[.]\d+[,]\d+[.]\d+/)
         return true
      else
          return false
      end
  end
  
  
end
