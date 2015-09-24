# nodes = {:A => [:B, :C], 
# :B => [:D, :E], 
# :C => [:F, :G], 
# :D => [:B], 
# :E => [:B], 
# :F => [:C],
# :G => [:C],}

# require 'pqueue'

# class Algorithm
# INFINITY = 1 << 32

# def self.dijkstra(source, edges, weights, n)
# visited = Array.new(n, false)
# shortest_distances = Array.new(n, INFINITY)
# previous = Array.new(n, nil)
# pq = PQueue.new(proc {|x,y| shortest_distances[x] < shortest_distances[y]})

# pq.push(source)
# visited[source] = true
# shortest_distances[source] = 0

# while pq.size != 0
# v = pq.pop
# visited[v] = true
# if edges[v]
# edges[v].each do |w|
# if !visited[w] and shortest_distances[w] > shortest_distances[v] + weights[v][w]
# shortest_distances[w] = shortest_distances[v] + weights[v][w]
# previous[w] = v
# pq.push(w)
# end
# end
# end
# end
# return [shortest_distances, previous]
# end
# end

nodes = {:A => [:B], 
:B => [:C], 
:C => [:D]}


require 'set'
require 'pry'

def shortest_path(nodes, starting, ending)
  queue = []
  path = []
  p [starting, ending, queue]
  visited = Set.new
  return [starting] if starting == ending 
  if nodes[starting].include?(ending)
    path.push(starting, ending)
    visited.add(starting)
    queue.push(nodes[starting])
    return path
  end
  queue.each do |node|
    path = [starting] + shortest_path(nodes, node, ending, path) 
  end
  path 
end 

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

for data in test_data
  given = data[:given]
  actual = shortest_path(given[:aj], given[:from], given[:to])
  passed = actual == data[:expected]
  if passed
    puts "passed: #{data[:name]}"
    next
  else
    puts "failed: #{data[:name]}"
    puts "expected:"
    p data[:expected]
    puts "got:"
    p actual
    exit 1
  end
end


