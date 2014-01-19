# require 'Neighbour'
class BusstopNode
	attr_accessor :id, :neighbours, :busstop, :distance, :visited
	@@graph = Array.new
	def initialize(id = 0, *neighbour)
		@busstop = Busstop.new
		@id = -1
		@distance = -1
		@visited = false
		#@current = false
		if not @id == 0
			@id = id			
		end
		@neighbours = Array.new
		neighbour.each do |n|
			@neighbours << n
		end
	end

	def self.graph
		@@graph
	end

	def self.addToGraph(data)
		@@graph << data
	end

	def self.printGraph
		@@graph.each do |node|
			print "Node id ==> #{node.id} ==> "
			node.neighbours.each do |neighbour|
				print "[#{ObjectSpace._id2ref(neighbour).id}]"
			end
			print "\n"
		end
	end

	def getBusstop(id)
		@id = id
		return @busstop = Busstop.find(id)
	end

	def self.createGraph
		allBusstops = Busstop.all
		allBusstops.each do |currentBusstop|
			
			#sleep(3)
			@@graph << newNode = BusstopNode.new
			newNode.busstop = currentBusstop
			newNode.id = currentBusstop.id
			print "\nNode ID: #{newNode.id}\nNode Object_ID: #{newNode.object_id}"
			#Assigning Neighbours
		end

		print "\nInitial Nodes Created\n\n"

		@@graph.each do |newNode|
			print "\n\nStarting New Busstop Iteration\n\n\nEnter To Start:"
			#gets()
			currentBusstop = newNode.busstop

			routesForBusstop = currentBusstop.routes
			routesForBusstop.each do |currentRoute|
				relationForSequence = RouteBusstop.where(:busstop_id => currentBusstop.id, :route_id => currentRoute.id)
				if relationForSequence.second.blank?
					print "\nNo Second Object found. Valid Yet\n\n"
					currentBusstopSequenceNumber = relationForSequence.first.busStopSequenceNumber
					print "\nValue for currentBusstopSequenceNumber ==> #{currentBusstopSequenceNumber}\n\n"
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
			self.displayNode(newNode)
		end
		return @@graph
	end

	def self.findBusstopFromGraph(busstop_id)
		foundBusstopCount = 0
		@@graph.each do |node|
			if node.id == busstop_id
				print "Node Found From Graph for next Busstop"
				return node
			end
			
		end
	end

	def self.displayNode(newNode)
		print "\n\nPrinting Node Properties\n\n"
		print "\tNode ID = #{newNode.id}\n"
		print "\tNode Object_ID = #{newNode.object_id}\n"

		print "\tNode BusstopName = #{newNode.busstop.busStopName}\n"
		print "\tNode Neighbours ==> #{newNode.neighbours}"
		
	end

	def self.findNeighbourBusstop(route_id = 0, busStopSequenceNumber = 0)
		relationForNeighbourBusstops = RouteBusstop.where(:route_id => route_id, :busStopSequenceNumber => busStopSequenceNumber)
		print "\ncount for relationForNeighbourBusstops ==> #{relationForNeighbourBusstops.count}\n\n"
		print "\nRelation RouteBusstop For nextBusstopSequenceNumber ==> #{relationForNeighbourBusstops.first.to_yaml}\n\n"
		if not relationForNeighbourBusstops.blank?
			nextBusstopToCurrentBusstop = Busstop.find(relationForNeighbourBusstops.first.busstop_id)
			print "\n\nNeighbour Busstop to currentBusstop ==> #{nextBusstopToCurrentBusstop.to_yaml}\n\n"
			return nextBusstopToCurrentBusstop.id
		end
		
	end

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
		self.createGraph
		if self.validateGraph == true
			print "\n\nGraph is Valid. Continuing...\n\n"
		else
			puts "Graph Not Valid"
			return false
		end
		sourceNode = self.findBusstopFromGraph(startID)
		puts "Start Busstop Found."
		destNode = self.findBusstopFromGraph(endID)
		sourceNode.distance = 0
		puts "\nsourceNode:#{sourceNode.to_yaml}"
		puts "\nDestinationNode:#{destNode.to_yaml}"
		#sourceNode.current = true
		pathRoute << sourceNode
		currentNode = sourceNode
		while true
			if currentNode.id == destNode.id
				print "#{currentNode.to_yaml}"
				print "Algo complete"
				@@graph = []
				return pathRoute
			end
			unVisitedNodes = self.allUnvisitedNode
			shortestDistance = 999999999999999
			truthArray = []

			currentNode.neighbours.each do |neighbour|
				neighbourNode = ObjectSpace._id2ref(neighbour.objectID)
				if neighbourNode.visited == true
					truthArray << neighbourNode.visited
				end
			end
			if truthArray.size >= currentNode.neighbours.size
				neighbourList = []
				currentNode = pathRoute.last
				if not currentNode == nil
					neighbourIDs = currentNode.neighbours.collect(&:objectID)
					neighbourIDs.each do |neighbourID|
						neighbourList << ObjectSpace._id2ref(neighbourID)
					end
					if not neighbourList.collect(&:visited).include?(false)
						currentNode = pathRoute.pop
					end

					#currentNode = pathRoute.pop
					currentNode.visited = true
					"\n\n\n"
					puts "BackTrackning to : #{currentNode.busstop.busStopName}"
					"\n\n\n"
				else currentNode == nil
					puts "end of algo. Reached  Back to sourceNode."
					return false		#end of algo. Reached  Back to sourceNode.
				end
			end
			if (truthArray.size == currentNode.neighbours.size)
				puts "We Need BackTracking..."
			end
			distanceToNeighboursArray = []
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
			if distanceToNeighboursArray.size > 0
				distanceToNeighboursArray.sort
				shortestDistanceToNeighbour = distanceToNeighboursArray.first
				currentNode.neighbours.each do |neighbour|
					neighbourNode = ObjectSpace._id2ref(neighbour.objectID)
					if neighbourNode.visited == false
						neighbourNodeLatLong = neighbourNode.busstop.busStopLatLong
						currentNodeLatLong = currentNode.busstop.busStopLatLong
						transitionDistance = Distance.calculateDistance(currentNodeLatLong,neighbourNodeLatLong)
						if (shortestDistanceToNeighbour == transitionDistance)
							currentNode.visited = true
							currentNode = neighbourNode
							pathRoute << currentNode
							distanceToNeighboursArray = []
						end
					end
				end
				print "\n\n\nRouteFound ===>>\n\n\n"
				pathRoute.each do |u|
					puts "#{u.busstop.busStopName}"
				end
				print"\n\n\n\n"
			end
		end
	end
end