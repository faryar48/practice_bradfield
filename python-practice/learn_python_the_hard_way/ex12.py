the_count = [1, 2, 3, 4, 5]
fruits = ['apples', 'oranges', 'pears', 'apricots']
change = [1, 'pennies', 2, 'dimes', 3, 'quarters']

for number in the_count: 
    print "This is count %d" % number 

for fruit in fruits: 
    print "A fruit of type: %s" % fruit 

for i in change: 
    print "I got %r" % i 

elements = []

for i in range(0, 6): 
    print "Adding %d to the list." % i 
    elements.append(i)

for i in elements: 
    print "Element was: %d" % i 

# How do you make a 2-dimensional (2D) list? 

# That's a list in a list like this: [[1,2,3],[4,5,6]] 

# Aren't lists and arrays the same thing? 

# Depends on the language and the implementation. In classic terms a list is very different from an array because of how they're implemented. In Ruby though they call these arrays. In Python they call them lists. Just call these lists for now since that's what Python calls them. 

# Why is a for-loop able to use a variable that isn't defined yet? 

# The variable is defined by the for-loop when it starts, initializing it to the current element of the loop iteration, each time through. 

# Why does for i in range(1, 3): only loop two times instead of three times? 

# The range() function only does numbers from the first to the last, not including the last. So it stops at two, not three in the above. This turns out to be the most common way to do this kind of loop. 

i = 0 
numbers = []
while i < 6: 
    print "At the top i is %d" % i 
    numbers.append(i)

    i += 1 
    print "Numbers now: ", numbers
    print "At the bottom i is %d" % i 

print "The numbers: "

for num in numbers: 
    print num 


# What's the difference between a for-loop and a while-loop? 

# A for-loop can only iterate (loop) "over" collections of things. A while-loop can do any kind of iteration (looping) you want. However, while-loops are harder to get right and you normally can get many things done with for-loops. 























