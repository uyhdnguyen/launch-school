# What is the output of the following code?

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# The copy of reference of variable answer was passed into method mess_with_it
# the method return a new reference to the new value of (answer +8).
# Variable new_answer is assigned to the value (answer + 8)
# Hence, answer still points to 42
# p answer - 8 will reference to value 34