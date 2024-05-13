=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Additionally, if the number is negative, return 0.

Note: If the number is a multiple of both 3 and 5, only count it once.

PROBLEM
-------
-input: natural number
-output: integer that is the sum of all of the multiples of 3/5

- find the sum of all of the multiples of 3/5
- if number is both  multiple of both 3 and 5, count just once
- 
- if the number is negative, return 0.

EXAMPLES
--------
given number : 10
multiples : 3, 5, 6, 9
sum : 23

given number : 20
multiples : 3, 5, 6, 9, 15
sum : 

DATA STRUCTURES
---------------
- array contains all of the multiples
- sum keeps track of the sum of multiples

ALGORITHM
---------
- create a counter to keep track for the loop
  - `counter`=ben
- create sum keeps track of the sum of multiples
  - `sum`
- create multiples of 3 or 5
  - increase from 3 until counter is >= given number
  - if it divisible by 3 or 5
  - increase the `sum`
- return the `sum`

=end

# def multiples_of_3_and_5(num)
#   sum = 0
#   counter = 3

#   while counter < num
#     sum += counter if counter % 3 == 0 || counter % 5 == 0
#     counter += 1
#   end
  
#   sum
# end

def multiples_of_3_and_5(num)
  multiples = []
  counter = 3

  while counter < num
    multiples << counter if counter % 3 == 0 || counter % 5 == 0
    counter += 1
  end
  
  multiples
end

p multiples_of_3_and_5 10

p multiples_of_3_and_5 20