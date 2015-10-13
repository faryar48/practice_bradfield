def add(a, b): 
    print "ADDING %d + %d" % (a, b)
    return a + b 

def subtract(a, b): 
    print "SUBTRACTING %d - %d" % (a, b)
    return a - b 

print "Let's do some fun math:"

age = add(5, 19)
weight = subtract(130, 15)
height = add(60, 4)

print "Age: %d, weight: %d, height: %d" % (age, weight, height)

# How can I use raw_input() to enter my own values? 

# Remember int(raw_input())? The problem with that is then you can't enter floating point, so also try using float(raw_input()) instead.

def secret_formula(started): 
    jelly_beans = started * 500 
    jars = jelly_beans / 1000 
    crates = jars / 100 
    return jelly_beans, jars, crates


start_point = 10000
beans, jars, crates = secret_formula(start_point)

print "With a starting point of: %d" % start_point
print "We'd have %d beans, %d jars, and %d crates." % (beans, jars, crates)

start_point = start_point / 10 

print "We can also do that this way:"
print "We'd have %d beans, %d jars, and %d crates." % secret_formula(start_point)

# Why do you you call the variable jelly_beans but the name beans later? 

# That's part of how a function works. Remember that inside the function the variable is temporary. When you return it then it can be assigned to a variable for later. I'm just making a new variable named beans to hold the return value. 