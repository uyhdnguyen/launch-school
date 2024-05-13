=begin
SECOND TRY 11 MINS
37. Multiples of 3 or 5

(https://www.codewars.com/kata/514b92a657cdc65150000006/train/ruby)

6 kyu

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is

23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 below the number passed in.

Note: If the number is a multiple of both 3 and 5, only count it once.

PROBLEM
-------
- find all multiples of 3 or 5 below the given num
- if the num is both multiple of 3 and 5, only count 1

EXAMPLES
--------
10
3,5,6,9
-> 23

20
3,5,6,9,10,12,15,18

DATA STRUCTURES
---------------
- input: integer

- ARRAY contains all of the mulitples

- output: integer that is the sum of all of the natural numbers which are less than given int

ALGORITHM
---------
- create a sum counter to keep track of the sum
- create counter to keep track of current number
- loop until current number is equal or greater than given int
  - current_number is divisible by 3 and 5 -> increase the sum
  - current_number is divisible by 3 -> increase the sum
  - current_number is divisible by 5 -> increase the sum 
- return the sum

=end

def solution(num)
  sum = 0

  current_number = 3

  while current_number < num
    case
    when current_number % 3 == 0 && current_number % 5 == 0
      sum += current_number
    when current_number % 5 == 0
      sum += current_number
    when current_number % 3 == 0
      sum += current_number
    end
    current_number += 1
  end

  sum
end

p solution(10) == 23

p solution(20) == 78

p solution(200) == 9168