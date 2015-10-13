# print "Hello World!"
# print "Hello Again"
# print "I will now count my chickens", 30 / 2 

# cars = 100 
# space_in_cars = 4.0 

# print "there are", cars, "cars available."
# print "since there are", cars, "cars available, and", space_in_cars, "spaces in cars, we can take", cars * space_in_cars, "people to burning man"

# print "Hey %s there." % "you"


# my_name = "Faryar" 
# my_age = 24 
# my_height = 64
# my_weight = 115 
# my_eyes = "green"
# my_hair = "brown"

# print "Let's talk about %s." % my_name
# print "She is %d inches tall." % my_height
# print "She weighs %d pounds." % my_weight
# print "She has %s eyes and %s hair." % (my_eyes, my_hair)
# print "If I add my weight, %d, my height, %d, and my age, %d, I get %d." % (my_weight, my_height, my_age, my_weight + my_height + my_age)


# x = "There are %d types of people." % 10 
# binary = "binary"
# do_not = "don't"
# y = "those who know %s and those who %s" % (binary, do_not)

# print x 
# print y 

# print "I said: %r" % x
# print "I also said '%s'" % y 

# hilarious = False 
# joke_eval = "Isn't that joke so funny?! %r"

# print joke_eval % hilarious

# w = "this is the left side of the "
# e = "string, and this is the right"

# print w + e 

# formatter = "%r %r %r %r"

# print formatter % (1, 2, 3, 4)
# print formatter % ("one", "two", "three", "four")
# print formatter % (True, False, False, True)
# print formatter % (formatter, formatter, formatter, formatter)
# print formatter % ("did you know?", "what it feels like?", "when it rains?", "in the snow?")

# months = "Jan\nFeb\nMarch\nApril"

# print "Here are the months: ", months
# print "Here are the months: %s" % months
# print "Here are the months: %r" % months # doesn't work because That's how %r formatting works; it prints it the way you wrote it (or close to it). It's the "raw" format for debugging.



# print """
# What is going on here? 
# Can i just type as much as I want? 
# """

# tabby_cat = "\tI am tabbed in."
# persian_cat = "I am split \non a line"
# backlash_cat = "I'm \\ a \\ cat"
# fat_cat = """
# I'll do a list: 
# \t*Chips 
# \t*Dips 
# \t*Kips\n\t*Lips
# """

# print tabby_cat, persian_cat, backlash_cat, fat_cat

# # When I use a %r format none of the escape sequences work.

# # That's because %r is printing out the raw representation of what you typed, which is going to include the original escape sequences. Use %s instead. Always remember this: %r is for debugging, %s is for displaying.

# print "How old are you?", 
# age = raw_input()
# print "What is your name?",
# name = raw_input()
# print "How much do you weigh?",
# weight = raw_input()

# print "My name is %r, I am %r, and I weigh %r pounds." % (name, age, weight)
# print "My name is %s, I am %s, and I weigh %s pounds." % (name, age, weight)

# # How do I get a number from someone so I can do math?

# # That's a little advanced, but try x = int(raw_input()) which gets the number as a string from raw_input() then converts it to an integer using int().


# name = raw_input("What is your name? ")
# age = raw_input("How old are you? " )
# weight = raw_input("How much do you weigh? ")


# print "My name is %s, I am %s, and I weigh %s pounds." % (name, age, weight)



# from sys import argv 


# script, first, second, third = argv 

# print "The script is called:", script 
# print "The first variable is:", first 
# print "The second variable is:", second 
# print "The third variable is:", third 


# make sure to pass this in command like:
# python ex1.py Faryar (or some other user_name)
from sys import argv 

script, user_name = argv 

prompt = '>=> '

print "Hi %s, I'm the %s script." % (user_name, script)
print "I'd like to ask you a few questions."
print "Do you like me %s" % user_name
likes = raw_input(prompt)

print "Where do you live %s" % user_name
lives = raw_input(prompt)

print "What kind of computer do you have?"
computer = raw_input(prompt)

print """
Alright, so you said %r about liking me. You live in %r. Not sure where that is. And you have a %r computer. Nice. 
""" % (likes, lives, computer)







































































