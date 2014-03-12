class BusstopOnMap
	attr_accessor :busStopName, :busStopLatLong, :route_id, :next_route_id
	def initialize()
		
		@busStopName = ""
		@busStopLatLong = ""
		@route_id = 0
		@next_route_id = nil

	end

	def initialize(busstop,route_id)
		@busStopName = busstop.busStopName
		@busStopLatLong = busstop.busStopLatLong
		@route_id = route_id
		@next_route_id = nil
	end

end