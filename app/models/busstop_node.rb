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
			

		end
		
	end
end