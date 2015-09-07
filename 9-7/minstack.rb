
require 'pry'

# 4. Design a stack that supports the methods push, pop and top as usual, but which at any point can also retrieve the minimum element in the stack in _constant_ time: https://leetcode.com/problems/min-stack/

class MinStack
    # Initialize your data structure here
    def initialize
     @stack = []
     @min = Float::INFINITY
     @min_last = @min
    end

    # @param {Integer} x
    # @return {Void} nothing
    def push(x)
      @stack.push(x)
      if x <= @min
        @min_last = @min
        @min = x 
      end 
      return nil 
    end

    # @return {Void} nothing
    def pop 
      popped_value = @stack.pop
      @min = @min_last if popped_value == @min 
      return nil 
    end

    # @return {Integer}
    def top
      @stack.last
    end

    # @return {Integer}
    def getMin
      @min
    end
end



test_cases = [
  {given: [[:push, [1], nil]]}, 
  {given: [[:push, [1], nil], [:top, [], 1]]}, 
  {given: [[:push, [1], nil], [:getMin, [], 1]]}, 
  {given: [[:push, [1], nil], [:push, [2], nil], [:pop, [], nil], [:getMin, [], 1]]}, 
  {given: [[:push, [2], nil], [:push, [0], nil], [:push, [3], nil], [:push, [0], nil], [:getMin, [], 0], [:pop, [], nil], [:getMin, [], 0], [:pop, [], nil], [:getMin, [], 0], [:pop, [], nil], [:getMin, [], 2]]}, 

]



test_cases.each do |test_case|
  p test_case[:given]
  stack = MinStack.new
  test_case[:given].each do |(method_name, arguments, expected_return_value)|
    actual = stack.send(method_name, *arguments)
    if actual != expected_return_value
      p "fail", method_name, arguments, expected_return_value, actual
      exit 
    end 
  end 
  p "pass" 
end 





















