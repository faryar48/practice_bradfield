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


[ ['LAX','LAS'], ['LAX','PHX'], ['LAS','LAX'], ['LAS','PHX'], ['LAS','DEN'], ['DEN','LAS'], ['DEN','PHX'], ['DEN','ORD'], ['ORD','DEN'], ['ORD','PHX'],
['ORD','DFW'], ['ORD','HOU'], ['ORD','ATL'], ['ORD','JFK'], ['PHX','LAX'], ['PHX','LAS'], ['PHX','DEN'], ['PHX','ORD'], ['PHX','DFW'], ['DFW','PHX'], ['DFW','ORD'], ['DFW','HOU'], ['HOU','DFW'], ['HOU','ORD'], ['HOU','ATL'],
['HOU','MCO'], ['ATL','HOU'], ['ATL','ORD'], ['ATL','JFK'], ['ATL','MCO'], ['JFK','ORD'], ['JFK','ATL'], ['JFK','MCO'], ['MCO','HOU'], ['MCO','ATL'], ['MCO','JFK'] ]


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

p adjacency_list[:LAX].include?(:PHX)


def find_shortest_paths(adjacency_list, starting, ending, visited = Set.new)
  nodes_connected_starting = adjacency_list[starting]
  return [[starting, ending]] if nodes_connected_starting.include?(ending)
  complete_paths = []
  incomplete_paths = []
  queue = []
  nodes_connected_starting.each do |node|
    if adjacency_list[node].include?(ending) 
      complete_paths.push([starting, node, ending])
    else 
      queue.push(node) if adjacency_list[node].length > 0
      visited.add(node)
      incomplete_paths.push([starting, node])
    end
  end
  visited.add(starting)
  return complete_paths if !complete_paths.empty?
  incomplete_paths.each do |path|
    return [] if visited.include?(starting)
    p find_shortest_paths(adjacency_list, path.last, ending, visited)
  end
end


test_cases = [
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

p "nodes"
test_cases.each do |test_case| 
  actual = find_shortest_paths(*test_case[:given])
  if actual == test_case[:expected]
    p "pass" 
  else 
    p "fail", actual, test_case[:expected]
  end
end 







# @param {Integer} num_courses
# @param {Integer[][]} prerequisites
# @return {Boolean}
def can_finish(num_courses, prerequisites)
  return true if prerequisites == 0



end

def dfs(index, visited, graph)
  if visited[index] == -1 
    return false 
  elsif visited[index] == 1 
    return true 
  end   
end 

# if havne't explored, then invoke DFS 
# if vertex been explored, don't search from it 


test_cases = [
  {given: [2, [[1,0]]], expected: true},
  {given: [2, [[1,0],[0,1]]], expected: false},
]








































