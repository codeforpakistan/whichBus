class RouteBusstop < ActiveRecord::Base
  
  belongs_to :route
  belongs_to :busstop
  belongs_to :admin
end
