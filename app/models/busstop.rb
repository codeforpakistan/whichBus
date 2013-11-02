class Busstop < ActiveRecord::Base
    has_many     :route_busstops, :dependent => :restrict
    has_many     :routes, through: :route_busstops
    belongs_to   :admin
    
    
    #errors.add(:busStopName, 'heelo' )
    validates :busStopName, presence: true, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }
    validates :busStopLatLong, presence: true, numericality: true
    validates :busStopSecName, format: { with: /\A^[a-zA-Z\d ]+$\Z/i, message: "only allows letters, numbers and space" }, :allow_blank => true
    
    def self.search(search)
      if search
        return Busstop.find(:all, :conditions => ['busStopName LIKE ?', "%#{search}%"])
      else
         return Busstop.find(:all)
      end
    end
    
end


