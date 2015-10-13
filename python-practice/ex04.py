# this one is like your scripts with argv 

def print_two(*args):
    arg1, arg2, = args 
    print "arg1: %r, arg2: %r" % (arg1, arg2)

def print_two_again(arg1, arg2): 
    print "arg1: %r, arg2: %r" % (arg1, arg2) 

# just one argument 

def print_one(arg1): 
    print "arg1: %r" % arg1 

# this one takes no arguments 

def print_none(): 
    print "I got nothin' ."


print_two("Faryar", "Ghaemi")
print_two_again("Faryar", "Ghaemi")
print_one("Just One")
print_none()

