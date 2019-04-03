require_relative 'node'

class Graph

  attr_accessor :degrees_actor

	def initialize
		@connection_list = []  
		@temp_actor_node = nil
	end

	def find_kevin_bacon(actor_node)
    actor_node.film_actor_hash.each do |movie, actors|
			if actors.any? { |actor| actor.name == "Kevin Bacon" }
				@connection_list.push(movie)
					if @connection_list.length > 6
						return "Unable to find a connection of 6 degrees or less"
					else
						return @connection_list
					end
			else
        @connection_list.push(movie) unless @connection_list.include?(movie)
        @temp_actor_node = actors.first
			end
    end
    find_kevin_bacon(@temp_actor_node)
	end
end
