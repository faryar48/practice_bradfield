# https://gist.github.com/quackingduck/d3a00736b996d55f5564#file-graph-problems-md

# First, model this graph - i.e. represent it using the tools of your language such that you capture all the information in it.

# graph

# Write a function to find the shortest path between two nodes. For example the shortest path between JFK and LAX is JFK-ORD-PHX-LAX

# Write a function that takes as input just a node in this graph (that is connected to its neighbors) and returns a clone of the complete graph

# Course Schedule My Submissions Question Solution (from leetcode)

# There are a total of n courses you have to take, labeled from 0 to n - 1.

# Some courses may have prerequisites, for example to take course 0 you have to first take course 1, which is expressed as a pair: [0,1]

# Given the total number of courses and a list of prerequisite pairs, is it possible for you to finish all courses?

# For example:

# 2, [[1,0]]
# There are a total of 2 courses to take. To take course 1 you should have finished course 0. So it is possible.

# 2, [[1,0],[0,1]]
# There are a total of 2 courses to take. To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.

require 'set'


adjacency_list = {:LAX => Set.new([:LAS, :PHX]),
:LAS => Set.new([:DEN, :LAX, :PHX]),
:DEN => Set.new([:LAS, :PHX, :ORD]),
:ORD => Set.new([:DEN, :PHX, :DFW, :HOU, :ATL, :JFK]),
:JFK => Set.new([:ORD, :ATL, :MCO]),
:ATL => Set.new([:ORD, :HOU, :MCO, :JFK]),
:PHX => Set.new([:LAS, :LAX, :DEN, :ORD, :DFW]),
:DFW => Set.new([:PHX, :ORD, :HOU]),
:HOU => Set.new([:DFW, :ORD, :ATL, :MCO]),
:MCO => Set.new([:ATL, :HOU, :JFK])}


nodes = {:A => [:B, :C], 
:B => [:D, :E], 
:C => [:F, :G], 
:D => [:B], 
:E => [:B], 
:F => [:C],
:G => [:C],
}

require 'set'
require 'pry'

# BFS 
# the original graph_work was a mess, so i deleted the file 
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

p shortest_path(nodes, :A, :B)
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



# these test cases don't pass yet since we need to return ALL of the shortest paths 
airport_test_cases = [
  {given: [adjacency_list, :JFK, :ORD], expected: [
    [:JFK, :ORD]]},

  {given: [adjacency_list, :JFK, :HOU], expected: [
    [:JFK, :ORD, :HOU], 
    [:JFK, :ATL, :HOU], 
    [:JFK, :MCO, :HOU]]},

  {given: [adjacency_list, :JFK, :LAS], expected: [
    [:JFK, :ORD, :DEN, :LAS], 
    [:JFK, :ORD, :PHX, :LAS]]},

]

p "airport"
airport_test_cases.each do |test_case| 
  actual = shortest_path(*test_case[:given])
  if actual == test_case[:expected]
    p "pass" 
  else 
    p "fail", actual, test_case[:expected]
  end
end 


