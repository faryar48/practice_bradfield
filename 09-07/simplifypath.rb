# Given an absolute path for a file (Unix-style), simplify it.

# For example,
# path = "/home/", => "/home"
# path = "/a/./b/../../c/", => "/c"
# click to show corner cases.

# Corner Cases:
# Did you consider the case where path = "/../"?
# In this case, you should return "/".
# Another corner case is the path might contain multiple slashes '/' together, such as "/home//foo/".
# In this case, you should ignore redundant slashes and return "/home/foo".

# @param {String} path
# @return {String}

require 'pry'

def tokenize(path)
  path.scan(/\.+\w+|\w+|\.+|\//)
end

def stack_reducer(stack, value)
  return stack if value == "."
  return stack[0...-1] if value == ".."
  stack + [value]
end

def simplify_path(string)
  "/" + tokenize(string).
  reject { |token| token == "/" }.
    reduce([], &method(:stack_reducer)).
    join("/")
end

test_cases = [
  {given: "/home/", expected: "/home"},  
  {given: "/a/./b/../../c/", expected: "/c"}, 
  {given: "/../", expected: "/"},  
  {given: "/home//foo/", expected: "/home/foo"},
  {given: "/...", expected: "/..."}, 
  {given: "/.", expected: "/"},  
  {given: "/./", expected: "/"}, 
  {given: "/..hidden", expected: "/..hidden"}, 
]


p "simplify_path"
test_cases.each do |test_case| 
  actual = simplify_path(test_case[:given])
  if actual == test_case[:expected]
    p "pass" 
  else 
    p "fail", actual, test_case[:expected]
  end
end 

stack_reducer_test_cases = [
  {given: [[], "a"], expected: ["a"]}, 
  {given: [["a"], "."], expected: ["a"]}, 
  {given: [["a", "b"], ".."], expected: ["a"]}, 
  {given: [["a", "b"], "."], expected: ["a", "b"]}, 
]

# p "stack_reducer"
# stack_reducer_test_cases.each do |test_case| 
#   actual = stack_reducer(*test_case[:given])
#   if actual == test_case[:expected]
#     p "pass"
#   else 
#     p "fail", actual, test_case[:expected]
#   end 
# end 

tokenize_test_cases = [
  {given: "/home/", expected: ["/", "home", "/"]},  
  {given: "/a/./b/../../c/", expected: ["/", "a", "/", ".", "/", "b", "/", "..", "/", "..", "/", "c", "/"]}, 
  {given: "/../", expected: ["/", "..", "/"]},  
  {given: "/home//foo/", expected: ["/", "home", "/", "/", "foo", "/"]},
  {given: "/...", expected: ["/", "..."]},
  {given: "/.", expected: ["/", "."]},  
  {given: "/./", expected: ["/", ".", "/"]}, 
]

# p "tokenize"

# tokenize_test_cases.each do |test_case| 
#   actual = tokenize(test_case[:given])
#   if actual == test_case[:expected]
#     p "pass"
#   else 
#     p "fail", actual, test_case[:expected]
#   end 
# end 


