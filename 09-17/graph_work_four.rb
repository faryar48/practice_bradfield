nodes = {:A => [:B, :C, :D], 
:B => [:A, :D, :E], 
:C => [:A, :F, :G], 
:D => [:A, :B, :E], 
:G => [:C, :E],
:E => [:B, :G, :D],
:F => [:C],

}


require 'set'
require 'pry'

# BFS
# same as graph_work_three but implementing a "previous"
def shortest_path(nodes, starting, ending)
  queue = [starting]
  previous = {}
  previous[starting] = nil
  while !queue.empty?
    p queue
    last_node = queue.pop
    if last_node == ending
      path = []
      while previous[last_node]
        path.unshift(last_node)
        last_node = previous[last_node]
      end
      path.unshift(starting)
      return path
    end
    if neighbors = nodes[last_node]
      neighbors.each do |neighbor|
        unless previous.has_key?(neighbor)
          queue.unshift(neighbor) 
          previous[neighbor] = last_node
        end
      end
    end
  end
end

p shortest_path(nodes, :B, :F)
p shortest_path(nodes, :D, :F)
p shortest_path(nodes, :A, :G)


