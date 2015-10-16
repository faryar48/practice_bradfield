# from sys import argv 

# script, filename = argv 

# txt = open(filename)

# print "Here's your file %r:" % filename
# print txt.read()

# print "Type the filename again:"
# file_again = raw_input("> ")

# txt_again = open(file_again)

# print txt_again.read()

from sys import argv 

script, filename = argv 

print "We are going to erase %r." % filename
print "If you don't want that, hit CTRL-C (^C)."
print "If you do want that, hit RETURN."

raw_input("?")

print "Opening the file..."
target = open(filename, 'w')

print "Truncating the file. Goodbye!"
target.truncate()

print "Now I am going to ask you for three lines."

line1 = raw_input("Line 1: ")
line2 = raw_input("Line 2: ")
line3 = raw_input("Line 3: ")

print "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")


print "And finally, we clost it."
target.close()

 # What does 'w' mean?

# It's really just a string with a character in it for the kind of mode for the file. If you use 'w' then you're saying "open this file in 'write' mode," thus the 'w' character. There's also 'r' for "read," 'a' for append, and modifiers on these.

# Does just doing open(filename) open it in 'r' (read) mode?
# Yes, that's the default for the open() function.











