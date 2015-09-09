# 5. Write a basic calculator that can evaluate a string containing non-negative integers, open and closing parentheses and plus and minus signs: https://leetcode.com/problems/basic-calculator/


# Implement a basic calculator to evaluate a simple expression string.

# The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .

# You may assume that the given expression is always valid.

# Some examples:
# "1 + 1" = 2
# " 2-1 + 2 " = 3
# "(1+(4+5+2)-3)+(6+8)" = 23
# Note: Do not use the eval built-in library function.


# @param {String} s
# @return {Integer}
def calculate(s)
  operator = ['+', '-', '*', '/']
  stack = []
  s.chars.each do |c| 
    stack.push(c) if c != " "
  end 
  while stack.pop
    new_value = 0 
    new_value.method
    stack.pop.to_i if stack.pop.to_i.is_a? Integer 
    if operator.include?(stack.pop)

    end 
  end 
end

test_cases = [
  {given: "1 + 4", expected: 5},  
  {given: " 2-1 + 2 ", expected: 3}, 
  {given: "(1+(4+5+2)-3)+(6+8)", expected: 23},  

]


test_cases.each do |test_case| 
  actual = calculate(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 


# operator = ['+', '-', '*', '/']
# operator.map {|o| 2.public_send o,2 }
# # => [4, 0, 4, 1]


# operator = ['+', '-', '*', '/']
# operator.map {|o| 2.method(o).(2) }
# # => [4, 0, 4, 1]




