class RouteBusstop < ActiveRecord::Base

	include Neoid::Relationship
	neoidable do |c|
    	c.relationship start_node: :route, end_node: :busstop, type: :route_busstops
  	end
	belongs_to :route
	belongs_to :busstop
	belongs_to :admin
end
