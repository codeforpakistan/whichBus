class Route < ActiveRecord::Base
  has_many :route_busstops
  has_one :admin
  has_many :routes, through: :route_busstops
end
