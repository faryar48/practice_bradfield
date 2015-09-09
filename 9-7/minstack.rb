

require 'pry'

# 4. Design a stack that supports the methods push, pop and top as usual, but which at any point can also retrieve the minimum element in the stack in _constant_ time: https://leetcode.com/problems/min-stack/

class MinStack
  # Initialize your data structure here
  def initialize
    @stack = []
    @min = Float::INFINITY
    @min_stack = []
  end

  # @param {Integer} x
  # @return {Void} nothing
  def push(x)
    @stack.push(x)
    if x <= @min
      @min = x
      @min_stack.push(x)
    end
    nil
  end

  # @return {Void} nothing
  def pop
    popped_value = @stack.pop
    @min_stack.pop if popped_value == @min
    @min = @min_stack.last
    @min = Float::INFINITY if @min_stack.empty? 
    nil
  end

  # @return {Integer}
  def top
    @stack.last
  end

  # @return {Integer}
  def get_min
    @min_stack.last 
  end
end

test_cases = [
  { given: [
    [:push, [1], nil]
  ] },
  { given: [
    [:push, [1], nil],
    [:top, [], 1]
  ] },
  { given: [
    [:push, [1], nil],
    [:get_min, [], 1]
  ] },
  { given: [
    [:push, [1], nil], # min is 1
    [:push, [2], nil], # min is still 1
    [:pop, [], nil],   # pop removes 2 which is max anyway
    [:get_min, [], 1]   # min is still 1
  ] },
  { given: [
    [:push, [2], nil], # min is 2
    [:push, [0], nil], # now it's 0
    [:push, [3], nil], # still 0
    [:push, [0], nil], # still 0, but there's two zero's in the internal stack
    [:get_min, [], 0],  # will be zero
    [:pop, [], nil],   # pop off one of the zeros
    [:get_min, [], 0],  # will be zero
    [:pop, [], nil],   # pop off 3
    [:get_min, [], 0],  # min is zero
    [:pop, [], nil],   # pop off 0
    [:get_min, [], 2]   # no more zero's in stack, min should now be 2
  ] }, 
  { given: [
    [:push, [2147483646], nil], # min is 2147483646
    [:push, [2147483646], nil], # min is still 2147483646
    [:push, [2147483647], nil], # now it's 2147483647
    [:top, [], 2147483647], # spit out 2147483647
    [:pop, [], nil],  # pop off 2147483647
    [:get_min, [], 2147483646],   # min is still 2147483646
    [:pop, [], nil],  # pop off 2147483646
    [:get_min, [], 2147483646],   # min is still 2147483646
    [:pop, [], nil],  # now have an empty array []
    [:push, [2147483647], nil],   # [2147483647]
    [:top, [], 2147483647],  # spit out 2147483647
    [:get_min, [], 2147483647],   # min is 2147483647
    [:push, [-2147483648], nil],  # [2147483647, -2147483648]
    [:top, [], -2147483648],  # spit out -2147483648
    [:get_min, [], -2147483648], # min is now -2147483648
    [:pop, [], nil],  # pop off -2147483648
    [:get_min, [], 2147483647], # min is now 2147483647
  ] }, 
  { given: [
    [:push, [395], nil], 
    [:get_min, [], 395], 
    [:top, [], 395], 
    [:get_min, [], 395], 
    [:push, [276], nil],  
    [:push, [29], nil],   
    [:get_min, [], 29],  
    [:push, [-482], nil],   
    [:get_min, [], -482],
    [:pop, [], nil],  # will pop off -482
    [:push, [-108], nil], 
    [:push, [-251], nil],   
    [:get_min, [], -251], 
    [:push, [-439], nil],
    [:top, [], -439],
    [:push, [370], nil], 
    [:pop, [], nil],  # will pop off 370
    [:pop, [], nil],  # will pop off -439
    [:get_min, [], -251], 
  ] }
]




test_cases.each do |test_case|
  p test_case[:given]
  stack = MinStack.new
  test_case[:given].each do |(method_name, arguments, expected_return_value)|
    actual = stack.send(method_name, *arguments)
    if actual != expected_return_value
      p 'fail', method_name, arguments, expected_return_value, actual
      exit
    end
  end
  p 'pass'
  puts '---'
end






















