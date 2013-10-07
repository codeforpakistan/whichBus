class Route < ActiveRecord::Base
  has_many :route_busstops
  has_many :busstops, through: :route_busstops
  
  has_one :admin
  
  has_many :companies, through: :company_routes
  has_many :company_routes
end
