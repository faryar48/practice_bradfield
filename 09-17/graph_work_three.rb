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
def shortest_path(nodes, starting, ending)
  queue = [[starting]]
  visited = Set.new
  while !queue.empty?
    p queue
    last_path = queue.pop
    last_node = last_path.last
    visited.add(last_node)
    return last_path if last_node == ending
    if neighbors = nodes[last_node]
      neighbors.each do |neighbor|
        unless visited.include?(neighbor)
          new_path_to_queue = last_path + [neighbor]
          queue.unshift(new_path_to_queue) 
        end
      end
    end
  end 
end 

p shortest_path(nodes, :B, :F)
