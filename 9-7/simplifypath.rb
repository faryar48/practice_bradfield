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
def simplify_path(path)
  stack = []
  path.split("/").each do |c| 
    stack.push(c)
  end 
end


test_cases = [
  {given: "/home/", expected: "/home"},  
  {given: "/a/./b/../../c/", expected: "/c"}, 
  {given: "/../", expected: "/"},  
  {given: "/home//foo/", expected: "/home/foo"},  

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