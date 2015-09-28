nodes = {:A => [:B, :C], 
:B => [:D, :E], 
:C => [:F, :G], 
# :D => [:B], 
# :E => [:B], 
# :F => [:C],
# :G => [:C],
}

require 'set'
require 'pry'

# BFS 
def shortest_path(nodes, starting, ending)
  queue = [[starting]]
  while !queue.empty?
    last_path = queue.pop
    last_node = last_path.last
    return last_path if last_node == ending
    if neighbors = nodes[last_node]
      neighbors.each do |neighbor|
        new_path_to_queue = last_path + [neighbor]
        queue.unshift(new_path_to_queue) 
      end
    end 
  end 
end 

# p shortest_path(nodes, :A, :B)
p shortest_path(nodes, :A, :A)
p shortest_path(nodes, :A, :E) #[:A, :B, :E]

test_data = [
  {
    :name => "single node, path found",
    :given => {
      :aj => {
        :a => [],
      },
      :from => :a,
      :to => :a,
    },
    :expected => [:a]
  },
  {
    :name => "single node, no path",
    :given => {
      :aj => {
        :a => [],
      },
      :from => :a,
      :to => :b,
    },
    :expected => []
  },
  {
    :name => "two nodes",
    :given => {
      :aj => {
        :a => [ :b ],
        :b => [ :a ],
      },
      :from => :a,
      :to => :b,
    },
    :expected => [:a, :b]
  },
  {
    :name => "three nodes",
    :given => {
      :aj => {
        :a => [ :b ],
        :b => [ :a, :c ],
        :c => [ :b ],
      },
      :from => :a,
      :to => :c,
    },
    :expected => [:a, :b, :c]
  },
]

# for data in test_data
#   given = data[:given]
#   actual = shortest_path(given[:aj], given[:from], given[:to])
#   passed = actual == data[:expected]
#   if passed
#     puts "passed: #{data[:name]}"
#     next
#   else
#     puts "failed: #{data[:name]}"
#     puts "expected:"
#     p data[:expected]
#     puts "got:"
#     p actual
#     exit 1
#   end
# end


