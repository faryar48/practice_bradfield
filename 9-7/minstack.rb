
# 4. Design a stack that supports the methods push, pop and top as usual, but which at any point can also retrieve the minimum element in the stack in _constant_ time: https://leetcode.com/problems/min-stack/

class MinStack
    # Initialize your data structure here
    def initialize
     @stack = []
     @min = Float::INFINITY
    end

    # @param {Integer} x
    # @return {Void} nothing
    def push(x)
      @stack.push(x)
      @min = x if x < @min 
      return nil 
    end

    # @return {Void} nothing
    def pop
        
    end

    # @return {Integer}
    def top
      @stack.last
    end

    # @return {Integer}
    def get_min
      @min
    end
end



test_cases = [
  {given: [[:push, [1], nil]]}, 
  {given: [[:push, [1], nil], [:top, [], 1]]}, 
  {given: [[:push, [1], nil], [:get_min, [], 1]]}, 
  {given: [[:push, [1], nil], [:push, [2], nil], [:pop, [], 2], [:get_min, [], 1]]}, 
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





















