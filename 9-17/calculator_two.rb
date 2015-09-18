def calculate(string)
  return 0 if string.empty? 
  tokenize(string).reduce([], &method(:token_reducer)).last.to_i
end

def tokenize(string)
  string.scan(%r/
    \d+ # series of numbers 
    | # or
    [\+\-\(\)] # one of these operators 
    /x)
end

def token_reducer(stack, value)
  return operator_reducer(stack, value) if is_operator?(value)
  return open_paren_reducer(stack, value) if value == "("
  return closed_paren_reducer(stack, value) if value == ")"
  return number_reducer(stack, value)
end

def is_operator?(value)
  return true if value == "+" || value == "-"
end

def operator_reducer(stack, value)
  stack + [value]
end

def open_paren_reducer(stack, value)
  stack + [value]
end

def number_reducer(stack, value)
  top = stack.last 
  return stack + [value] unless is_operator?(top)
  operator = stack.pop 
  lhs = stack.pop
  stack + [apply_operator(lhs, operator, value)] 
end

def closed_paren_reducer(stack, value)
  rhs = stack.pop
  stack.pop
  number_reducer(stack, rhs)
end

def apply_operator(lhs, operator, rhs)
  case operator
  when "+" then lhs.to_i + rhs.to_i
  when "-" then lhs.to_i - rhs.to_i 
  else
    raise "unknown operator: #{operator}" 
  end
end


calculate_test_cases = [
  {given: "1 + (2 + 3) - 4", expected: 2}, 
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


token_reducer_test_cases = [
  # empty stack push value 
  {given: [[], 1], expected: [1]},
  # value is operator, push value
  {given: [[1], "+"], expected: [1, "+"]},
  # value is open parenthesis, push value
  {given: [[1, "+"], "("], expected: [1, "+", "("]},
  # value is number, push value 
  {given: [[1, "+", "("], 2], expected: [1, "+", "(", 2]},
  # value is operator, push value
  {given: [[1, "+", "(", 2], "+"], expected: [1, "+", "(", 2, "+"]},
  # value is number when peak is operator, pop operator and LHS and evaluate with value, then pushed result 
  {given: [[1, "+", "(", 2, "+"], 3], expected: [1, "+", "(", 5]},
  # value is closed parenthesis, pop peak and pop once more (open parenthesis), now do same operation as above (number reduce)
  {given: [[1, "+", "(", 5], ")"], expected: [6]},
  # value is operator, push value
  {given: [[6], "-"], expected: [6, "-"]},
  # value is number when peak is operator, pop operator and LHS and evaluate with value, then pushed result 
  {given: [[6, "-"], 4], expected: [2]},

]

p "token_reducer"
token_reducer_test_cases.each do |test_case| 
  actual = token_reducer(*test_case[:given])
  if actual == test_case[:expected]
    p "pass"
  else 
    p "fail", actual, test_case[:expected]
    exit
  end
end 