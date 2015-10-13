
################################################################################
# Exercise 1 : Count the elements in a list: len(li)
################################################################################
my_list_1 = [2, 4, 6, 8, 10]

print ("\nExercise 1")
print len(my_list_1)
print ("The list my_list_1 has {0} elements".format(len(my_list_1)))

################################################################################
# Exercise 2 : Add 12 and 14 to the end of the list: li.append()
################################################################################

my_list_1
my_list_1.append(12)
my_list_1.append(14)

#OR:

my_list_1 = my_list_1 + [12, 14]

print ("\nExercise 2")
print ("The list my_list_1 is now", my_list_1)

# ################################################################################
# # Exercise 3 : Add 0 to the beginning of the list
# ################################################################################


my_list_1 =  [0] + my_list_1
#OR
my_list_1.insert(0, 0)
print ("\nExercise 3")
print ("The list my_list_1 is now", my_list_1)

# ################################################################################
# # Exercise 4 : Create a new list using my_list_1,
# # with the values [0, 4, 6, 8, 10, 14] (that is, delete 2 and 12).
"""li.remove()

del li[index of item to delete]
del li[index of item to delete]

remove works better in this case"""
################################################################################
# my_list_2 = my_list_1.copy()
my_list_2 = list(my_list_1)
my_list_2.remove(2)
my_list_2.remove(12)

del my_list_2[4]

print("\nExercise 4")
print("The list my_list_2 is", my_list_2)

# ################################################################################
# # Exercise 5 : Create a new list where the values are divided by 3
# ################################################################################
my_list_3 = my_list_1
my_list_3 = []
for item in my_list_1:
    my_list_3.append(item/3.0)

print("\nExercise 5")
print("The list my_list_2 is", my_list_3)

# ################################################################################
# # Exercise 6 : print all the elements in the list (use direct for loop)
# ################################################################################
print("\nExercise 6")
for element in my_list_3:
    print element

# ################################################################################
# # Exercise 7 : print all the elements and their corresponding index
# # use range or enumerate.
# ################################################################################
# Option 1 : range
print("\nExercise 7 - using range")

for index in range(len(my_list_3)):
    print index, my_list_3[index]

print("\nExercise 7 - using enumerate")
# Option 2 : Enumerate

for element in my_list_3:
   print element


print list(enumerate(my_list_3))
# ################################################################################
# # Exercise 8 : print all the values of my_list_1 and my_list_2, side by side.
# # use range or zip.
# ################################################################################
# # Option 8 : range


print("\nExercise 8 - using zip")
# Option 8 : zip

print(my_list_2)
print(my_list_3)
zipped = zip(my_list_2, my_list_3)
print zipped

#OR

for  element_in_2,  element_in_3 in zip(my_list_2, my_list_3):
    print  element_in_2, element_in_3

# ################################################################################
# # Exercise 9 : Sort the my_list_4 in ascending order
# ################################################################################
my_list_4 = [10, 4, 3, 8, 9]
print("\nExercise 9")
print("my_list_4 in ascending order is", sorted(my_list_4))

my_list_4.sort() # prints 'none'


# ################################################################################
# # Exercise 10 : Sort the list_4
# ################################################################################
my_list_4 = [10, 4, 3, 8, 9]
print("\nExercise 10")
print("my_list_4 in descending order is", sorted(my_list_4, reverse=True))
# ################################################################################

hobbies = []

# Add your code below!
# for i in range(3):
#     hobby = raw_input("What's your hobby?")
#     hobbies.append(hobby)
# ################################################################################
# zip will create pairs of elements when passed two lists,
# and will stop at the end of the shorter list.
# zip can handle three or more lists as well!

# Compare each pair of elements and print the larger of the two.

list_a = [3, 9, 17, 15, 19]
list_b = [2, 4, 8, 10, 30, 40, 50, 60, 70, 80, 90]

for a, b in zip(list_a, list_b):
    # Add your code here!
    if len(list_a) < len(list_b):
        print max(a,b)
# ################################################################################
# the items should appear to start at index 1.
choices = ['pizza', 'pasta', 'salad', 'nachos']

print 'Your choices are:'
for index, item in enumerate(choices):
    print index+1, item
# ################################################################################

def purify(number):
    new_list = []
    for num in number:
        if num % 2 == 0:
            new_list.append(num)
    return new_list

# ################################################################################
# build a list of the numbers from 0 to 50 (inclusive).

my_list = range(51)

print(purify(my_list))



