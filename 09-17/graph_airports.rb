require 'priority_queue'
require 'set'
require 'pry'
 
class Graph
    def initialize()
        @vertices = {}
    end

    def to_s
        return @vertices.inspect 
    end 
  
    def add_vertex(name, neighbors)
        @vertices[name] = neighbors
    end
    
    def shortest_path(start, finish)
        maxint = (2**(0.size * 8 -2) -1)
        previous = {}
        nodes = PriorityQueue.new

        
        @vertices.each do |vertex, value|
            if vertex == start
                nodes[vertex] = 0
            else
                nodes[vertex] = maxint
            end
            previous[vertex] = nil
        end
        
        while nodes
            smallest = nodes.delete_min_return_key
            # binding.pry
            
            if smallest == finish
                # binding.pry
                path = []
                while previous[smallest]
                    path.push(smallest)
                    smallest = previous[smallest]
                end
                return path
            end
            
            if smallest == nil
                break         
            end

            @vertices[smallest].each do |neighbor|
                previous[neighbor] = smallest
            end
        end
    end
end


g = Graph.new 
g.add_vertex(:LAX, [:LAS, :PHX])
g.add_vertex(:LAS, [:DEN, :LAX, :PHX])
g.add_vertex(:DEN, [:LAS, :PHX, :ORD])
g.add_vertex(:ORD, [:DEN, :PHX, :DFW, :HOU, :ATL, :JFK])
g.add_vertex(:JFK, [:ORD, :ATL, :MCO])
g.add_vertex(:ATL, [:ORD, :HOU, :MCO, :JFK])
g.add_vertex(:PHX, [:LAS, :LAX, :DEN, :ORD, :DFW])
g.add_vertex(:DFW, [:PHX, :ORD, :HOU])
g.add_vertex(:HOU, [:ATL, :ORD, :DFW, :MCO])
g.add_vertex(:MCO, [:ATL, :HOU, :JFK])
puts g.shortest_path(:JFK, :LAX)




