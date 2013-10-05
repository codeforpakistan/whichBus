class Busstop < ActiveRecord::Base
  has_many :route_busstops
  has_many :routes, through: :route_busstops
end
