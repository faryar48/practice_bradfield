people = 20 
cats = 30 
dogs = 15 

if people < cats: 
    print "Too many cats! The world is doomed!"

if people > cats: 
    print "Not many cats! The world is saved!"

if people < dogs: 
    print "The world is drooled on!"

if people > dogs: 
    print "The world is dry!"


dogs += 5 

if people >= dogs: 
    print "People are greater than or equal to dogs."

if people <= dogs: 
    print "People are less than or equal to dogs."

if people == dogs: 
    print "People are dogs."


people = 30 
cars = 40 
trucks = 15 

if cars > people: 
    print "We should take the cars."
elif cars < people: 
    print "We should not take the cars."
else: 
    print "We can't decide."

if trucks > cars: 
    print "That's too many trucks."
elif trucks < cars: 
    print "Maybe we could take the trucks."
else: 
    print "We still can't decide."

if people > trucks: 
    print "Alright, let's just take the trucks."
else: 
    print "Fine, let's stay home then."

print "You enter a dark room with two doors. Do you go through door #1 or door #1?"

door = raw_input("> ")

if door == "1": 
    print "There's a giant bear here eating a cheese cake. What do you do?"
    print "1. Take the cake."
    print "2. Scream at the bear."

    bear = raw_input("> ")

    if bear == "1": 
        print "The bear eats your face off. Good job!"
    elif bear == "2": 
        print "The bear eats your legs off. Good job!"
    else: 
        print "Well, doing %s is probably better. Bear runs away." % bear 

elif door == "2": 
    print "You stare into the endless abyss at Cthulhu's retina."
    print "1. Blueberries."
    print "2. Yellow jacket clothespins."
    print "3. Understanding revolvers yelling melodies."

    insanity = raw_input("> ")

    if insanity == "1" or insanity == "2": 
      print "Your body survives powered by a mind of jello. Good job!"
    else: 
        print "The insanity rots your eyes into a pool of muck."

else: 
    print "You stumble around and fall on a knife and die. Good job!"























