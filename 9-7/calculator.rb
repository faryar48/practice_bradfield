require 'pry'

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

def calculate(string)
  tokens = tokenize(string).map { |token_item| rubyize(token_item)}
  calculate_triple(triplize(tokens))
end 


def calculate_triple(triple)
  return 0 if triple.empty? 
  lhs, operator, rhs = triple 
  return lhs if triple.length == 1 
  raise "can't calculate: #{triple.inspect}" if triple.length == 2 
  lhs = calculate_triple(lhs) if lhs.is_a? Array 
  case operator
  when :+ then lhs + rhs 
  when :- then lhs - rhs 
  else 
    raise "unknown operator: #{operator}" 
  end 
end

calculate_triple_test_cases = [
  {given: [], expected: 0},
  {given: [1], expected: 1},
  {given: [1, :+, 3], expected: 4},
  {given: [[[1, :+, 1], :+, 4], :+, 5], expected: 11},

]

p "calculate_triple"
calculate_triple_test_cases.each do |test_case| 
  actual = calculate_triple(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end
end 

def triplize(list)
  return [] if list.empty?
  if list.length == 1 
    list
  elsif list.length == 2 
    raise "does not make sense"
  elsif list.length == 3 
    list
  else list.length > 3 
    head = list[0..2]
    rest = list[3..-1]
    triplize([head] + rest) 
  end 
end 

def rubyize(token_string)
  if token_string =~ /\d+/
    token_string.to_i 
  else
    token_string.to_sym
  end
end 


def tokenize(string)
  string.scan(%r/
    \d+ # series of numbers 
    | # or
    [\+\-\(\)] # one of these operators 
    /x)
end

def nestize(token_list)
  braces_stack = []
  depth_array = []
  is_open = false
  token_list.each do |item| 
    if item == "("
      # binding.pry
      is_open = true 
      # binding.pry
    end 
    if item == ")"
      # binding.pry
      braces_stack.push(depth_array) 
      is_open = false 
    end 
    if item != "(" && item != ")" 
      if is_open == true 
        # binding.pry
        depth_array.push(item)
      else 
        # binding.pry
        braces_stack.push(item)
      end 
    end
  end
  braces_stack
end 

nestize_test_cases = [
 {given: [], expected: []}, 
 {given: [1], expected: [1]}, 
 {given: [1, :+, 1], expected: [1, :+, 1]}, 
 {given: ["(", 1, ")"], expected: [[1]]}, 
 {given: [1, :+, "(", 2, :+, 3, ")"], expected: [1, :+, [2, :+, 3]]}, 
 {given: ["(", 1, :+, "(", 4, :+, 5, :+, 2, ")", :-, 3, ")", :+, "(", 6, :+, 8, ")"], expected: [[1, :+, [4, :+, 5, :+, 2], :-, 3], :+, [6, :+, 8]]}, 
]


p "nestize"
nestize_test_cases.each do |test_case| 
  actual = nestize(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 


triplize_test_case = [
 {given: [], expected: []}, 
 {given: [1], expected: [1]},
 {given: [1, :+, 1], expected: [1, :+, 1]},
 {given: [1, :+, 1, :+, 4], expected: [[1, :+, 1], :+, 4]},
 {given: [1, :+, 1, :+, 4, :+, 5], expected: [[[1, :+, 1], :+, 4], :+, 5]},
]

p "triplize"
triplize_test_case.each do |test_case| 
  actual = triplize(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 

tokenize_test_cases = [
  {given: "", expected: []},
  {given: "1", expected: ["1"]},
  {given: "1 + 1", expected: ["1", "+", "1"]},
  {given: "1 + 21", expected: ["1", "+", "21"]},
  {given: "(1+(4+5+2)-3)+(6+8)", expected: ["(", "1", "+", "(", "4", "+", "5", "+", "2", ")", "-", "3", ")", "+", "(", "6", "+", "8", ")"]},  
]

p "tokenize"
tokenize_test_cases.each do |test_case| 
  actual = tokenize(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 


calculate_test_cases = [
  {given: "", expected: 0}, 
  {given: "1", expected: 1}, 
  {given: "1 + 1", expected: 2}, 
  {given: " 2-1 + 2 ", expected: 3}, 
  # {given: "(1+(4+5+2)-3)+(6+8)", expected: 23},  

]

p "calculate"
calculate_test_cases.each do |test_case| 
  actual = calculate(test_case[:given])
  if actual == test_case[:expected]
    p "pass", test_case[:given] 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end 
end 





