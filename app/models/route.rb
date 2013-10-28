class Route < ActiveRecord::Base
  has_many :route_busstops, :dependent => :destroy
  has_many :busstops, through: :route_busstops
  
  has_one :admin
  
  has_many :companies, through: :company_routes
  has_many :company_routes
  
  
  
  validates :routeName, presence: true, uniqueness: true, format: { with: /\A[\sa-z0-9]+\Z/i, message: "only allows alphanumeric" }
  validates :routeSourceName, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :routeDestName, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :routeDistance, numericality: true, :allow_blank => true
  validates :routeSourceLatLong, numericality: true, :allow_blank => true
  validates :routeDestLatLong, numericality: true, :allow_blank => true
  validates :routeTravelTime, numericality: true, :allow_blank => true
  
end
