class BusstopNode < Busstop
	attr_accessor :id, :neighbours
	@@graph = Array.new
	def initialize(id = 0, *neighbour)
		super
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
end