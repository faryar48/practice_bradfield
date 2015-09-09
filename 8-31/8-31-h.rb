require 'pry'

# Problem 1 

# Write a function that returns the first matching element in a list of lists - i.e. a "nested list" also known as a tree

# depth 
# def select(node, &matcher)
#   return [] if node.empty? # base case 
#   head = node[0] 
#   rest = node[1..-1]
#   if head.is_a? Array
#     select(head, &matcher) + select(rest, &matcher)
#   else
#     (matcher.call(head) ? [head] : []) + select(rest, &matcher) 
#   end
# end 


# matcher = lambda { |n| n == 1 }
# p select([0, [1], [1], 0, 1], &matcher) # => [1, 1, 1]
# p select([0, [1], [1, 0, 1, 0], 0, 1], &matcher) # => [1, 1, 1, 1]
# p select([], &matcher) # => []
# p select([0], &matcher) # => []
# p select([1], &matcher) # => [1]
# p select([1, 0], &matcher) # => [1]
# p select([[1][0]], &matcher) # => [1]
# p select([1, [1]], &matcher) # => [1, 1]
# p select([0, [1], [1]], &matcher) # => [1, 1]


# matcher = lambda { |item| item.include?("a") }

# p select([], &matcher) # []
# p select(["hay"], &matcher) # ["hay]
# p select(["choc"], &matcher) # []
# p select(["choc", "hay"], &matcher) # ["hay"] 
# p select(["choc", "hay", "nay", "hi"], &matcher) # ["hay", "nay"] 
# p select(["hello", "my", "name", "is", "faryar", ["meow", "woof", "rawrrrr", "want"]], &matcher) # ["name", "faryar", "rawrrrr", "want"]
# p select(["hello", ["graffiti"], ["mosquito"], ["chicago", "sunglasses", "bottle"], "my", "name", "is", "faryar", ["meow", "woof", "rawrrrr", "want"]], &matcher) # ["graffiti", "chicago", "sunglasses", "name", "faryar", "rawrrrr", "want"]




# Problem 2 

# Write a function that flattens a tree (of any depth) into a list

# answer using +=
# def flatten(array)
#   return [] if array.empty? 
#   list = []
#   head = array[0]
#   rest = array[1..-1]
#   if head.is_a? Array 
#     flatten(head) + flatten(rest)
#   else 
#     list += [head] + flatten(rest)
#   end 
# end 

# array = ["hello", ["graffiti"], ["mosquito"], ["chicago", "sunglasses", "bottle"], "my", "name", "is", "faryar", ["meow", "woof", "rawrrrr", "want"]]
# p flatten(array)



# Problem 3 
# Write a function that produces all the (x, y) coordinates in an NxM grid


def coord(a, b)

end 




coord(3, 2) # [(1, 1), (1, 2), (1, 3), (2, 1), (2, 2), (2, 3)]


# Problem 4 
# Write isPrime(n)

# def isPrimeF(n)
#   divisor = 2 
#   while divisor < n 
#     n % divisor 
#     return false if n % divisor == 0 
#     divisor += 1
#   end  
#   true
# end 

# def isPrimeO(n)
#   (2...n).each do |factor|
#     return false if n % factor == 0 
#   end
#   true
# end


# p isPrimeF(17) # true 
# p isPrimeO(17) # true 
# p isPrimeF(16) # false 
# p isPrimeO(16) # false 
# p isPrimeF(2) # true  
# p isPrimeO(2) # true  
# p isPrimeF(32452867) # true
# p isPrimeO(32452867) # true


# Problem 5 
# Write a function that removes duplicate items from a list


# def remove_duplicate(list)
#   list.reduce([]) do |memo, item|
#     item = item.downcase if item.is_a? String 
#     memo.include?(item) ? memo : memo + [item]
#   end 
# end 


# p remove_duplicate([]) # []
# p remove_duplicate(["hello", "graffiti", "IS", "mosquito", "chicago", "sunglasses", "bottle", "my", "name", "is"]) # ["hello", "graffiti", "mosquito", "chicago", "sunglasses", "bottle", "my", "name", "is"]
# p remove_duplicate([1, 2, 3, 3]) # [1, 2, 3]



# oz notes 

# currently your’s has O(n*n) running time but doesn’t use extra space
# there are two faster approaches
# one that involves using a set which brings the running time down to O(n) but uses O(n) space
# the other involves first sorting the array, then looking at the elements in order, which takes O(nlogn) time and either O(1) space (if you can mutate the original array) or O(n) space (if you need to create a new one) 


# Problem 6 
# What are all the handshakes that would occur if n people all shook hands? (Design and model this problem first)

# def handshakes(number)
#   (1...number).reduce() do |memo, num|
#     memo + num
#   end 
# end 


# p handshakes(4) # 6 
# p handshakes(5) # 10 



# Problem 7 
# You are a recently elected dictator with $1m in aid money and a 1% probability that your citizens will rebel. Every time you make a withdrawal of $10k from the aid account the chance of rebellion doubles. What is the maximum amount you can extract from the aid account before the chance of rebellion is over 90%?
# Solve the problem concretely. Then parameterize it.


# Problem 8 
# Loop over the first 10 whole numbers, add them together, use a while loop. 

# def count_them_while(n)
#   count = 0 
#   x = 1 
#   while x <= n 
#     count += x 
#     x += 1 
#   end 
#   count
# end 

# p count_them_while(10) # 55 


# def count_them_each(n)
#   counter = 0 
#   (1..n).each do |x|
#     counter += x 
#   end 
#   counter
# end 

# p count_them_each(10) # 55 

# def count_them_reduce(n)
#   (0..n).reduce(0) do |memo, num|
#     memo + num 
#   end 
# end 

# p count_them_reduce(10) # 55 


# Write a function that joins a list of strings with some delimiter
# if you don't pass an initial value, reduce function will add the first two items in the array 

# below is the better answer in this case 
# my_array = ["hello", "my", "name", "is", "faryar"]

# def join(array, delimiter)
#   array.reduce() do |memo, item| 
#     memo + delimiter + item 
#   end 
# end 

# p join(my_array, ", ")


# we don't need to include the conditional if we take out the initial value in this case 
# my_array = ["hello", "my", "name", "is", "faryar"]

# def join(array, delimiter)
#   array.reduce("") do |memo, item| 
#     memo.empty? ? item : memo + delimiter + item 
#   end 
# end 

# join(my_array, ", ")

















































