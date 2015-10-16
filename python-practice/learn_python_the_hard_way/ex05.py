def cheese_and_crackers(cheese_count, boxes_of_crackers):
    print "You have %d cheeses!" % cheese_count
    print "You have %d boxes of crackers" % boxes_of_crackers


print "We can just give the function numbers directly:"
cheese_and_crackers(30, 20)

print "OR, we can use a variable for our script:"
amount_of_cheese = 10 
amount_of_crackers = 40 

cheese_and_crackers(amount_of_cheese, amount_of_crackers)

print "We can even do math inside too:"
cheese_and_crackers(10 + 5, 5 + 6)

print "AND we can combine the two, variables and math:" 
cheese_and_crackers(amount_of_cheese + 100, amount_of_crackers + 200)

# What if I want to ask the user for the numbers of cheese and crackers?
# You need to use int() to convert what you get from raw_input(). 

