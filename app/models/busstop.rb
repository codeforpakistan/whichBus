class Busstop < ActiveRecord::Base
    has_many     :route_busstops, :dependent => :restrict
    has_many     :routes, through: :route_busstops
    belongs_to   :admin
    
    
    validates :busStopName, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
    validates :busStopLatLong, presence: true, numericality: true
    validates :busStopSecName, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
