require 'pry'


# 1. Given a string of brackets, braces and parentheses determine if it is "balanced". I know you have already "solved" this one so do it again without referencing your original solution https://leetcode.com/problems/valid-parentheses/

def is_valid(s)
  stack = []
  braces = {
    '(' => ')', 
    '{' => '}', 
    '[' => ']'
  }

  s.chars.each do |c| 
    stack.push(c) if braces.has_key?(c) 
    if braces.has_value?(c)
      open_bracket = stack.pop
      return false if braces[open_bracket] != c 
    end 
  end 
  stack.empty?
end 

p is_valid("()[]{}") # true 
p is_valid("[]({})") # true 
p is_valid("([])") # true 
p is_valid("{()[]}") # true 

p !is_valid("([)]") # true 
p !is_valid(")(){}") # true 
p !is_valid("([)]") # true 
p !is_valid("())") # true 
p !is_valid("{())") # true 




# 2. Write a function which takes an integer and returns the same number as a string of binary digits. There are many ways to do this... see if you can find an elegant solution that progressively pushes powers of 2 to a stack, then pops into a string.

def binary(decimal_number)
  return "0" if decimal_number == 0
  powers_of_two = powers_of_two_for(decimal_number)
  binary_digits = []
  while last_exponent = powers_of_two.pop
    if decimal_number / last_exponent >= 1 
      binary_digits.push(1)
      decimal_number = decimal_number - last_exponent
    else 
      binary_digits.push(0)
    end 
  end 
  binary_digits.join("")
end 

def powers_of_two_for(decimal_number)
  powers_of_two = []
  exponent = 0 
  loop do 
    new_power_of_two = 2 ** exponent
    break if new_power_of_two > decimal_number
    powers_of_two.push(new_power_of_two)
    exponent += 1 
  end
  powers_of_two
end 


test_cases = [
  {given: 0, result: "0"},
  {given: 1, result: "1"},
  {given: 2, result: "10"}, 
  {given: 36, result: "100100"},
  {given: 100, result: "1100100"},
  {given: 88, result: "1011000"},
  {given: 3012, result: "101111000100"},

]

test_cases.each do |test_case| 
  actual = binary(test_case[:given])
  if actual == test_case[:result]
    p "pass"
  else 
    p "fail", actual, test_case[:result]
    exit
  end 
end 

# p binary(36) # 100100
# p binary(2) # 10
# p binary(1) # 1



# 3. Modify the function above to also take any base (up to say 36, so certainly binary, octal and hexadecimal).

def dec_to_string(decimal_number, base = 10)
  return "0" if decimal_number == 0
  powers_of_base = powers_for(decimal_number, base)
  digits = []
  while last_exponent = powers_of_base.pop
    base_count, decimal_number = decimal_number.divmod(last_exponent)
    digits.push(DIGITS[base_count])
  end 
  digits.join("")
end 

def powers_for(decimal_number, base = 10)
  powers_for_array = []
  exponent = 0 
  loop do 
    new_power_of_base = base ** exponent
    break if new_power_of_base > decimal_number
    powers_for_array.push(new_power_of_base)
    exponent += 1 
  end
  powers_for_array
end 

DIGITS = (0..9).to_a + ("a".."z").to_a

test_cases = [
  {given: [0, 2], expected: "0"},
  {given: [0, 3], expected: "0"},
  {given: [0, 4], expected: "0"},
  {given: [1, 2], expected: "1"},
  {given: [1, 3], expected: "1"},
  {given: [1, 4], expected: "1"},
  {given: [2, 2], expected: "10"},
  {given: [2, 3], expected: "2"},
  {given: [2, 4], expected: "2"},
  {given: [4, 4], expected: "10"},
  {given: [8, 8], expected: "10"},
  {given: [16, 16], expected: "10"},
  {given: [18, 16], expected: "12"},
  {given: [31, 16], expected: "1f"},
  {given: [33, 32], expected: "11"},
]

powers_for_test_cases = [
  {given: [0, 2], expected: []}, 
  {given: [0, 3], expected: []}, 
  {given: [0, 4], expected: []}, 
  {given: [1, 2], expected: [1]},
  {given: [3, 2], expected: [1, 2]},
  {given: [10, 4], expected: [1, 4]},
  {given: [10, 16], expected: [1]}, 
  {given: [18, 16], expected: [1, 16]}, 
  {given: [31, 16], expected: [1, 16]}, 
  {given: [40, 16], expected: [1, 16]}, 
  {given: [280, 16], expected: [1, 16, 256]}, 

]

p "powers"
powers_for_test_cases.each do |test_case| 
  actual = powers_for(*test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 

p "dec_to_string"
test_cases.each do |test_case| 
  actual = dec_to_string(*test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 




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



# 5. Write a basic calculator that can evaluate a string containing non-negative integers, open and closing parentheses and plus and minus signs: https://leetcode.com/problems/basic-calculator/


# 6. Write a calculator to evaluate an expression in Reverse Polish Notation: https://leetcode.com/problems/evaluate-reverse-polish-notation/


# 7. Given a unix style file path, reduce it to its cannonical form: https://leetcode.com/problems/simplify-path/
























