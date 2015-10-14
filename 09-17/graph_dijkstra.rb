require 'priority_queue'

class Graph
    def initialize()
        @vertices = {}
    end

    def add_vertex(name, edges)
        @vertices[name] = edges
    end

    def shortest_path(start, finish)
        maxint = (2**(0.size * 8 -2) -1)
        distances = {}
        previous = {}
        nodes = PriorityQueue.new

        @vertices.each do | vertex, value |
            if vertex == start
                distances[vertex] = 0
                nodes[vertex] = 0
            else
                distances[vertex] = maxint
                nodes[vertex] = maxint
            end
            previous[vertex] = nil
        end

        while nodes
            smallest = nodes.delete_min_return_key

            if smallest == finish
                path = []
                while previous[smallest]
                    binding.pry
                    path.push(smallest)
                    smallest = previous[smallest]
                end
                return path
            end

            if smallest == nil or distances[smallest] == maxint
                break
            end

            @vertices[smallest].each do | neighbor, value |
                alt = distances[smallest] + @vertices[smallest][neighbor]
                if alt < distances[neighbor]
                    distances[neighbor] = alt
                    previous[neighbor] = smallest
                    nodes[neighbor] = alt
                end
            end
        end
        return distances.inspect
    end

    def to_s
        return @vertices.inspect
    end
end


g = Graph.new
g.add_vertex(:LAX, {:LAS => 1, :PHX => 1})
g.add_vertex(:LAS, {:DEN => 1, :LAX => 1, :PHX => 1})
g.add_vertex(:DEN, {:LAS => 1, :PHX => 1, :ORD => 1})
g.add_vertex(:ORD, {:DEN => 1, :PHX => 1, :DFW => 1, :HOU => 1, :ATL => 1, :JFK => 1})
g.add_vertex(:JFK, {:ORD => 1, :ATL => 1, :MCO => 1})
g.add_vertex(:ATL, {:ORD => 1, :HOU => 1, :MCO => 1, :JFK => 1})
g.add_vertex(:PHX, {:LAS => 1, :LAX => 1, :DEN => 1, :ORD => 1, :DFW => 1})
g.add_vertex(:DFW, {:PHX => 1, :ORD => 1, :HOU => 1})
g.add_vertex(:HOU, {:ATL => 1, :ORD => 1, :DFW => 1, :MCO => 1})
g.add_vertex(:MCO, {:ATL => 1, :HOU => 1, :JFK => 1})
puts g.to_s
puts g.shortest_path(:JFK, :LAX)



