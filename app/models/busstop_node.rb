class BusstopNode
	attr_accessor :id, :neighbours, :busstop, :distance, :visited, :route_id
	@@graph = Array.new
	def initialize()
		@busstop = Busstop.new
		@id = -1
		@distance = -1
		@visited = false
		#@current = false
		@neighbours = Array.new
		@route_id = -1
	end
	#Getter Method For Graph
	def self.graph
		@@graph
	end
	#I Forgot what this was for. was written when the createGraph was written. Not being Used in current Scope.
	def self.addToGraph(data)
		@@graph << data
	end
	#print the Graph. No Real purpose. Too much output.
	def self.printGraph
		@@graph.each do |node|
			print "Node id ==> #{node.id} ==> "
			node.neighbours.each do |neighbour|
				print "[#{ObjectSpace._id2ref(neighbour).id}]"
			end
			print "\n"
		end
	end
	#return a busstop object. should be renamed to getBusstopByID.
	def getBusstop(id)
		@id = id
		return @busstop = Busstop.find(id)
	end

	#Create a graph from all the busstops data which is included in Routes.
	def self.createGraph
		allBusstops = Busstop.all
		allBusstops.each do |currentBusstop|
			
			#sleep(3)
			@@graph << newNode = BusstopNode.new
			newNode.busstop = currentBusstop
			newNode.id = currentBusstop.id
			# print "\nNode ID: #{newNode.id}\nNode Object_ID: #{newNode.object_id}"
			#Assigning Neighbours
		end

		print "\nInitial Nodes Created\n\n"

		@@graph.each do |newNode|
			# print "\n\nStarting New Busstop Iteration\n\n\nEnter To Start:"
			#gets()
			currentBusstop = newNode.busstop

			routesForBusstop = currentBusstop.routes
			routesForBusstop.each do |currentRoute|
				relationForSequence = RouteBusstop.where(:busstop_id => currentBusstop.id, :route_id => currentRoute.id)
				if relationForSequence.second.blank?
					# print "\nNo Second Object found. Valid Yet\n\n"
					currentBusstopSequenceNumber = relationForSequence.first.busStopSequenceNumber
					# print "\nValue for currentBusstopSequenceNumber ==> #{currentBusstopSequenceNumber}\n\n"
					nextBusstopSequenceNumber = currentBusstopSequenceNumber + 1
					previousBusstopSequenceNumber = currentBusstopSequenceNumber - 1
					if not(Route.find(currentRoute.id).busstops.count <= currentBusstopSequenceNumber)
						neighboursNode = Neighbour.new
						neighboursNode.objectID = self.findBusstopFromGraph(self.findNeighbourBusstop(currentRoute.id, currentBusstopSequenceNumber + 1)).object_id
						neighboursNode.cost = 1
						newNode.neighbours << neighboursNode
					end
					
					if not (currentBusstopSequenceNumber == 1)
						neighboursNode = Neighbour.new
						neighboursNode.objectID = self.findBusstopFromGraph(self.findNeighbourBusstop(currentRoute.id, currentBusstopSequenceNumber - 1)).object_id
						neighboursNode.cost = 1
						newNode.neighbours << neighboursNode

					end
					
					#Find the Busstop ==> relationForNeighbourBusstops.first.busstop_id from the graph array.
					#get the object_id for this  busstop and push it to newNode.neighbour.
					
				end

			end
			# self.displayNode(newNode)
		end
		return @@graph
	end
	#Find a given Node that contains a busstop with the given id. (Node.id and Node.busstop.id is the same)
	def self.findBusstopFromGraph(busstop_id)
		puts "Finding Busstop with id <==> #{busstop_id}"
		returnArray = []
		@@graph.each do |node|
			if node.busstop.id == busstop_id
				puts "Node Found From Graph for next Busstop"
				returnArray << node
			end
		end
		if returnArray.count == 1
			return returnArray.first

		else
			puts "Graph is in inValid State with #{returnArray.count} Nodes for #{busstop_id}"
			return nil
		end

	end
	#Print a given Node
	def self.displayNode(newNode)
		print "\n\nPrinting Node Properties\n\n"
		print "\tNode ID = #{newNode.id}\n"
		print "\tNode Object_ID = #{newNode.object_id}\n"

		print "\tNode BusstopName = #{newNode.busstop.busStopName}\n"
		print "\tNode Neighbours ==> #{newNode.neighbours}"
		
	end

	def self.findNeighbourBusstop(route_id = 0, busStopSequenceNumber = 0)
		relationForNeighbourBusstops = RouteBusstop.where(:route_id => route_id, :busStopSequenceNumber => busStopSequenceNumber)
		# print "\ncount for relationForNeighbourBusstops ==> #{relationForNeighbourBusstops.count}\n\n"
		# print "\nRelation RouteBusstop For nextBusstopSequenceNumber ==> #{relationForNeighbourBusstops.first.to_yaml}\n\n"
		if not relationForNeighbourBusstops.blank?
			nextBusstopToCurrentBusstop = Busstop.find(relationForNeighbourBusstops.first.busstop_id)
			# print "\n\nNeighbour Busstop to currentBusstop ==> #{nextBusstopToCurrentBusstop.to_yaml}\n\n"
			return nextBusstopToCurrentBusstop.id
		end
		
	end
	#Assert Type Method. Will Validate if the Graph is valid to work with or not.
	#Checks if all the object_id of neighbours are valid Node.object_id
	def self.validateGraph(graph = [])
		flag = true
		objectIDArray = Array.new
		graph.each do |node|
			objectIDArray << node.object_id
		end
		trueCount = 0
		graph.each do |node|
			node.neighbours.each do |neighbour|
				objectIDArray.each do |object_id|
					if neighbour.objectID == object_id
						trueCount  = trueCount + 1
					end
				end
				if trueCount > 1 or trueCount < 1
					flag =  false
				end
				trueCount = 0
			end
		end
		return flag
	end

	def self.allUnvisitedNode
		unVisitedNodes = Array.new
		@@graph.each do |node|
			if node.visited == false
				unVisitedNodes << node
			end
		end
		return unVisitedNodes
		
	end

	def self.findRoute(startID,endID)
		if not (Route.all.count > 0)
			puts "No Routes Exist."
			return false;
		end
		pathRoute = []
		@@graph = []
		self.createGraph
		if self.validateGraph == true
			print "\n\nGraph is Valid. Continuing...\n\n"
			puts "Total Nodes in @@Graph <==> #{@@graph.count}"
		else
			puts "Graph Not Valid"
			return false
		end
		puts "Node IDs for Graph ==> #{@@graph.collect(&:id).to_yaml}"
		sourceNode = self.findBusstopFromGraph(startID)
		puts "Start Busstop Found. ==> #{sourceNode.to_yaml}"
		# puts "Count For sourceNode ==> #{sourceNode.count}"
		destNode = self.findBusstopFromGraph(endID)
		puts "\nDestination Busstop Found ==> #{destNode.to_yaml}"
		sourceNode.distance = 0
		
		#sourceNode.current = true
		pathRoute << sourceNode
		currentNode = sourceNode
		#Lets find a path from Source to destination and then break. pathRoute will contain the sequence of busstops.
		while true
			#break and retrun `pathRoute` if we have reached the destinationNode.
			if currentNode.id == destNode.id
				print "#{currentNode.to_yaml}"
				print "Algo complete"
				@@graph = []
				return pathRoute
			end
			unVisitedNodes = self.allUnvisitedNode
			shortestDistance = 999999999999999
			truthArray = []
			#Is there any neighbour to the currentNode that has not been visited?
			currentNode.neighbours.each do |neighbour|
				neighbourNode = ObjectSpace._id2ref(neighbour.objectID)
				if neighbourNode.visited == true
					truthArray << neighbourNode.visited
				end
			end
			#is there any Neighbour node that has not been visited.
			if truthArray.size >= currentNode.neighbours.size
				neighbourList = []
				currentNode = pathRoute.last
				#currentNode == nil means the pathRoute is empty and we cannot backtrack. and shoud retrun false or ###return pathRoute.###
				if not currentNode == nil
					#object_id for all Neighbours.
					neighbourIDs = currentNode.neighbours.collect(&:objectID)
					neighbourIDs.each do |neighbourID|
						neighbourList << ObjectSpace._id2ref(neighbourID)
					end
					#if neighbourlist contains all visited Nodes. Then we need to backTrack.
					if not neighbourList.collect(&:visited).include?(false)
						currentNode = pathRoute.pop
					end

					currentNode.visited = true
					"\n\n\n"
					puts "BackTrackning to : #{currentNode.busstop.busStopName}"
					"\n\n\n"
				else currentNode == nil
					puts "end of algo. Reached  Back to sourceNode."
					return false		#end of algo. Reached  Back to sourceNode. ###Should Return pathRoute.###
				end
			end
			#remove this if condition in future.
			if (truthArray.size == currentNode.neighbours.size)
				puts "We Need BackTracking..."
			end
			#this will hold the Distances to all neighbours from the currentNode. (can assert that this has same count as currentNode.neighbours)
			distanceToNeighboursArray = []
			#Find distance To all neighbours to currentNode and push onto distanceToNeighboursArray.
			currentNode.neighbours.each do |neighbour|
				neighbourNode = ObjectSpace._id2ref(neighbour.objectID)
				# puts "\n\nneighbourNode => #{neighbourNode.to_yaml}\n\n"
				if neighbourNode.visited == false
					neighbourNodeLatLong = neighbourNode.busstop.busStopLatLong
					currentNodeLatLong = currentNode.busstop.busStopLatLong
					transitionDistance = Distance.calculateDistance(currentNodeLatLong,neighbourNodeLatLong)
					neighbourNode.distance = transitionDistance + currentNode.distance
					distanceToNeighboursArray << transitionDistance
				else
					puts "NeighbourNode already Visited. Moving On..."
				end
			end
			#check if there was any number of unvisited Nodes.
			#this codition if false means that all currentNode.neighbours has been visited.
			if distanceToNeighboursArray.size > 0
				distanceToNeighboursArray.sort
				#get the shorteset distance and find the neighbour it belongs to.
				shortestDistanceToNeighbour = distanceToNeighboursArray.first
				currentNode.neighbours.each do |neighbour|
					neighbourNode = ObjectSpace._id2ref(neighbour.objectID)
					if neighbourNode.visited == false
						neighbourNodeLatLong = neighbourNode.busstop.busStopLatLong
						currentNodeLatLong = currentNode.busstop.busStopLatLong
						transitionDistance = Distance.calculateDistance(currentNodeLatLong,neighbourNodeLatLong)
						#we found the Neighbour with shortest distance that has not been visited already. Now move to this node (set it as currentNode)
						if (shortestDistanceToNeighbour == transitionDistance)
							currentNode.visited = true
							currentNode = neighbourNode
							pathRoute << currentNode
							distanceToNeighboursArray = []
						end
					end
				end
				#print out the route Formed after each step.(After each transition)
				print "\n\n\nRouteFound ===>>\n\n\n"
				pathRoute.each do |u|
					puts "#{u.busstop.busStopName}"
				end
				print"\n\n\n\n"
			end
		end
	end


	def self.findRouteFrequencyFromPath(pathRoute)
		useBusAtBusstop = []
		unless pathRoute == false
			busstopArray = []
			busstopArray = pathRoute.collect(&:busstop)
			allBusstopRoutesArray = []
			pathRouteBusstopIDs = pathRoute.collect(&:id)
			puts "busstop IDs: #{pathRouteBusstopIDs}"
			pathRouteBusstopIDs.each do |busstop_id|
				routes =  Busstop.find(busstop_id).routes.collect(&:id)
				routes.each do |r|
					allBusstopRoutesArray << r
				end
			end
			puts "All BusStop Routes Array #{allBusstopRoutesArray.sort}"
			uniqueArray = allBusstopRoutesArray.uniq
			routeCount = Hash.new
			uniqueArray.each do |routeID|
				routeCount[routeID] = allBusstopRoutesArray.count(routeID)
			end
			uniqueArray = []
			puts "Sorted Hash : #{routeCount.sort_by { |key, value| value}}"
			sortedArrayFromHash = routeCount.sort_by { |key, value| value}
			sortedArrayFromHash.each do |keyValue|
				uniqueArray << keyValue.first
			end
			routeFrequency = uniqueArray.reverse
			# 
			busstopArray.each do |busstop|
				routeForBusstop = busstop.routes.collect(&:id)
				routeForBusstop = routeForBusstop & routeFrequency
				frequencyTable = Hash.new
				routeForBusstop.each do |aRouteID|
					frequencyTable[aRouteID] = allBusstopRoutesArray.count(aRouteID)
				end
				puts "Current Busstop: #{busstop.id}'s Frequency Table: #{frequencyTable.sort_by {|key, value| value}}"
				frequencyArrayFromHash = frequencyTable.sort_by {|key, value| value}
				busNumbers = []
				frequencyArrayFromHash.each do |keyValue|
					busNumbers << keyValue.first
				end
				busNumbers = busNumbers.reverse
				useBusAtBusstop << busNumbers.first
			end
		end
		travellingPath = Array.new
		iter = 0
		pathRoute.each do |aNode|
			aNode.route_id = useBusAtBusstop[iter]
			iter = iter + 1
			travellingPath << aNode.dup
		end
		puts "Please Use this Route ==> #{travellingPath.to_yaml}"
		return travellingPath
	end

	# def calculateTravelOption(busstopArray)
	# 	busstopArray = busstopArray.collect(&:id)
	# 	startBusstopID = busstopArray.first
	# 	destinationBusstopID = busstopArray.last
	# 	iter = 1
	# 	currentRoute = 0
	# 	routesToCheck = Busstop.find(startBusstopID).routes.collect(&:id)

	# 	while busstopArray[iter] != nil
	# 		nextBusstop	
	# 	end
	# end
end