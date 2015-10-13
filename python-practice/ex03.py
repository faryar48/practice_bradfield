from sys import argv 

from os.path import exists 

script, from_file, to_file = argv 

print "Copying from %s to %s" % (from_file, to_file)

# we could do these two on one line, how?
# in_file = open(from_file)
# indata = in_file.read()

indata = open(from_file).read()

print "The input file is %d bytes long" % len(indata)

print "Does the output file exist? %r" % exists(to_file)
print "Ready, hit RETURN to continue, CTRL-C to abort."
raw_input()

out_file = open(to_file, 'w')
out_file.write(indata)

print "Alright, all done."

out_file.close()
# in_file.close() # don't need this since we combined lines 10-11 into one line on line 13 

# COMMAND LINE: python ex3.py ex3_test.txt ex3_test_new.txt


