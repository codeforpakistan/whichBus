class Busstop < ActiveRecord::Base
  has_many :routes_busstops
  has_many :routes, through: :route_busstops
end
