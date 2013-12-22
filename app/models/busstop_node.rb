class BusstopNode
	attr_accessor :id, :neighbours, :busstop
	@@graph = Array.new
	def initialize(id = 0, *neighbour)
		@busstop = Busstop.new
		@id = -1
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
			@@graph << newNode = BusstopNode.new
			newNode.busstop = currentBusstop
			newNode.id = currentBusstop.id
			#Assigning Neighbours
			print "\nInitial Nodes Created\n\n"

			routesForBusstop = currentBusstop.routes
			routesForBusstop.each do |currentRoute|
				relationForSequence = RouteBusstop.where(:busstop_id => currentBusstop.id, :route_id => currentRoute.id)
				if relationForSequence.second.blank?
					print "\nNo Second Object found. Valid Yet\n\n"
					currentBusstopSequenceNumber = relationForSequence.first.busStopSequenceNumber
					print "\nValue for currentBusstopSequenceNumber ==> #{currentBusstopSequenceNumber}\n\n"
					nextBusstopSequenceNumber = currentBusstopSequenceNumber + 1
					relationForNeighbourBusstops = RouteBusstop.where(:route_id => currentRoute.id, :busStopSequenceNumber => nextBusstopSequenceNumber)
					print "\ncount for relationForNeighbourBusstops ==> #{relationForNeighbourBusstops.count}\n\n"
					if not relationForNeighbourBusstops.blank?
						nextBusstopToCurrentBusstop = Busstop.find(relationForNeighbourBusstops.first.busstop_id)
						newNode.neighbours << self.findBusstopFromGraph(relationForNeighbourBusstops.first.busstop_id).object_id
					end
					
					#Find the Busstop ==> relationForNeighbourBusstops.first.busstop_id from the graph array.
					#get the object_id for this  busstop and push it to newNode.neighbour.
					
				end
			end
		end
	end

	def self.findBusstopFromGraph(busstop_id)
		foundBusstopCount = 0
		@@graph.each do |node|
			if node.id == busstop_id
				return node
			end
			return nil
		end
	end
end