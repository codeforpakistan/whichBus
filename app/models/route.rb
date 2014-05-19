class Route < ActiveRecord::Base
    include Neoid::Node

    neoidable do |c|
        c.field :routeName
        c.field :routeDistance
    end

    has_many :route_busstops, :dependent => :destroy
    has_many :busstops, through: :route_busstops

    has_one :admin

    has_many :companies, through: :company_routes
    has_many :company_routes

    validates :routeName, presence: true, uniqueness: true, format: { with: /\A[\sa-z0-9]+\Z/i, message: "only allows alphanumeric" }
    validates :routeSourceName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, length: {minimum: 5, maximum: 25}
    validates :routeDestName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters numbers and space" }, length: {minimum: 5, maximum: 25}
    validates :routeDistance, numericality: true, :allow_blank => true
    validates :routeSourceLatLong, presence: true, format: {with: /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/, message: "Improper Format"} 
    validates :routeDestLatLong, presence: true, format: {with: /[+,-]?\d{1,2}[.]\d+[,]\s{0,1}[+,-]?\d{1,3}[.]\d+/, message: "Improper Format"}

    def self.search(search)
        if search
            # Busstop.find(:all, :conditions => ['busStopName LIKE ?', "%#{search}%"])
            # Busstop.find(:all, :conditions => ["\'busStopName\' ilike ?", "%#{search}%"])
            Busstop.where{(busStopName =~ "%#{search}%")}
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
  
end
