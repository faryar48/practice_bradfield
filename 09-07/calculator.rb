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

def tokenize_first(string)
  string.scan(%r/
    \d+ # series of numbers 
    | # or
    [\+\-\(\)] # one of these operators 
    /x)
end

def rubyize_second(token_string)
  if token_string =~ /\d+/
    token_string.to_i 
  else
    token_string.to_sym
  end
end 

def nestize_third(flat_array)
  depth_array = []
  braces_stack = 0
  opening_index = 0
  flat_array.each_with_index do |char, i|
    if char == "(" || char == :"("
      braces_stack += 1
      opening_index = i + 1 if braces_stack == 1
      next
    elsif char == ")" || char == :")"
      braces_stack -= 1
      if braces_stack == 0
        flat_array[opening_index...i]
        depth_array.push(nestize_third(flat_array[opening_index...i]))
      end
      next
    elsif braces_stack == 0
      depth_array.push(char) 
    end
  end
  depth_array
end


def triplize_fourth(list)
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
    triplize_fourth([head] + rest) 
  end
end 

def calculate_triple_fifth(triple)
  return 0 if triple.empty? 
  lhs, operator, rhs = triple 
  if triple.length == 1 
    if triple.first.is_a? Array
      return calculate_triple_fifth(triplize_fourth(triple.first))
    else
      return lhs
    end
  end
  raise "can't calculate: #{triple.inspect}" if triple.length == 2
  lhs = calculate_triple_fifth(triplize_fourth(lhs)) if lhs.is_a? Array 
  rhs = calculate_triple_fifth(triplize_fourth(rhs)) if rhs.is_a? Array 
  case operator
  when :+ then lhs + rhs
  when :- then lhs - rhs 
  else
    raise "unknown operator: #{operator}" 
  end
end

def calculate(string)
  tokens = tokenize_first(string).map { |token_item| rubyize_second(token_item)}
  nestized = nestize_third(tokens)
  triplized = triplize_fourth(nestized)
  calculated_triple = calculate_triple_fifth(triplized)
end


calculate_test_cases = [
  {given: "4+5+2", expected: 11},  
  {given: " 1 + (4+5+2)", expected: 12},            
  {given: "1+(4+5+2)-3", expected: 9}, 
  {given: "1 + (2 + 3)", expected: 6}, 
  {given: "(1 + (2 + 3))", expected: 6}, 
  {given: "", expected: 0}, 
  {given: "1", expected: 1}, 
  {given: "1 + 1", expected: 2}, 
  {given: " 2-1 + 2 ", expected: 3},
  {given: " 2- (1 + 2) ", expected: -1}, 
  {given: " (1 + 2 ) + (1 + 2 )", expected: 6},   
  {given: "(1+(4+5+2)-3)+(6+8)", expected: 23},
]

p "calculate"
calculate_test_cases.each do |test_case| 
  actual = calculate(test_case[:given])
  if actual == test_case[:expected]
    p "pass" 
  else 
    p "fail", actual, test_case[:expected]
    exit
  end
end 

tokenize_first_test_cases = [
  {given: "", expected: []},
  {given: "1", expected: ["1"]},
  {given: "1 + 1", expected: ["1", "+", "1"]},
  {given: "1 + 21", expected: ["1", "+", "21"]},
  {given: "(1+(4+5+2)-3)+(6+8)", expected: ["(", "1", "+", "(", "4", "+", "5", "+", "2", ")", "-", "3", ")", "+", "(", "6", "+", "8", ")"]},  
]

# p "tokenize_first"
# tokenize_first_test_cases.each do |test_case| 
#   actual = tokenize_first(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass", test_case[:given] 
#   else 
#     p "fail", actual, test_case[:expected]
#     exit
#   end
# end

nestize_third_test_cases = [
 {given: [], expected: []}, 
 {given: [1], expected: [1]}, 
 {given: [1, :+, 1], expected: [1, :+, 1]}, 
 {given: ["(", 1, ")"], expected: [[1]]}, 
 {given: [1, :+, "(", 2, :+, 3, ")"], expected: [1, :+, [2, :+, 3]]}, 
 {given: ["(", 1, :+, "(", 4, :+, 5, :+, 2, ")", :-, 3, ")", :+, "(", 6, :+, 8, ")"], expected: [[1, :+, [4, :+, 5, :+, 2], :-, 3], :+, [6, :+, 8]]}, 
 {given: [:"(", 1, :+, :"(", 4, :+, 5, :+, 2, :")", :-, 3, :")", :+, :"(", 6, :+, 8, :")"], expected: [[1, :+, [4, :+, 5, :+, 2], :-, 3], :+, [6, :+, 8]]}, 
]

# p "nestize_third"
# nestize_third_test_cases.each do |test_case| 
#   actual = nestize_third(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass", test_case[:given] 
#   else 
#     p "fail", actual, test_case[:expected]
#     exit
#   end 
# end

triplize_fourth_test_case = [
 {given: [], expected: []}, 
 {given: [1], expected: [1]},
 {given: [1, :+, 1], expected: [1, :+, 1]},
 {given: [1, :+, 1, :+, 4], expected: [[1, :+, 1], :+, 4]},
 {given: [1, :+, 1, :+, 4, :+, 5], expected: [[[1, :+, 1], :+, 4], :+, 5]},
]

# p "triplize_fourth"
# triplize_fourth_test_case.each do |test_case| 
#   actual = triplize_fourth(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass", test_case[:given] 
#   else 
#     p "fail", actual, test_case[:expected]
#     exit
#   end 
# end

calculate_triple_fifth_test_cases = [
  {given: [], expected: 0},
  {given: [1], expected: 1},
  {given: [1, :+, 3], expected: 4},
  {given: [[[1, :+, 1], :+, 4], :+, 5], expected: 11},
]

# p "calculate_triple_fifth"
# calculate_triple_fifth_test_cases.each do |test_case| 
#   actual = calculate_triple_fifth(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass", test_case[:given] 
#   else 
#     p "fail", actual, test_case[:expected]
#     exit
#   end
# end

calculate_test_cases = [
  {given: "", expected: 0}, 
  {given: "1", expected: 1}, 
  {given: "1 + 1", expected: 2}, 
  {given: " 2-1 + 2 ", expected: 3}, 
  {given: "(1+(4+5+2)-3)+(6+8)", expected: 23},  
]

# p "calculate"
# calculate_test_cases.each do |test_case| 
#   actual = calculate(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass", test_case[:given] 
#   else 
#     p "fail", actual, test_case[:expected]
#     exit
#   end
# end 













