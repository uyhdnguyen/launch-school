=begin
FIRST TRY: 20 MINS

18. Persistent Bugger.

(https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/ruby)

6 kyu

Write a function, persistence, that takes in a positive parameter num and returns its multiplicative persistence, which is

the number of times you must multiply the digits in num until you reach a single digit.

For example:

persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4

# and 4 has only one digit

persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,

# 1*2*6=12, and finally 1*2=2

persistence(4) # returns 0, because 4 is already a one-digit number

PROBLEM
-------
- input: positive integer
- output: integer that is multiplicative persistence

- method called `persistence`
- multiplicative persistence
  - number of times to multiply the digits of given number to get to the number with only one digit

EXAMPLES
--------
39
3 * 9 = 27
2 * 7 = 14
1 * 4 = 4
-> 3

999
9*9*9=729
7*2*9=126,
1*2*6=12
1*2=2
-> 4

DATA STRUCTURES
---------------
- array contains multiplications

ALGORITHMN
----------
- create helper method called `find_multiplications`
  - input: integer and multiplication array
  - output: multiplication array

  - return array if the size of given integer is 1
  - transform int to digits
    - digits/reverse
  - find the multiplication
    - reduce
  - return the multiplication
    - multiplications
  - recall `find_multiplication`
    - pass it multiplication and the result as arguments
--------------------------------------------------------
- return 0 if the given number is less then 10
- create multiplication result array
  - assign array to the result of calling `find_multiplications` and pass it given number
- return the size of the array
=end

def find_multiplications(num, multiplications = [])
  return multiplications if num.to_s.size == 1

  digits = num.digits.reverse
  multiplication = digits.reduce(&:*)
  multiplications << multiplication

  find_multiplications(multiplication, multiplications)
end

def persistence(num)
  return 0 if num < 10

  multiplications = find_multiplications(num)

  multiplications.size
end

p persistence(39) == 3

p persistence(4) == 0

p persistence(25) == 2

p persistence(999) == 4

def persistence(num)
  digits = num.digits
  counter = 0
  while digits.size > 1
    digits = digits.reduce(:*).digits
    counter += 1
  end
  counter
end
