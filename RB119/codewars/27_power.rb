=begin
27. Exponent method

(https://www.codewars.com/kata/5251f63bdc71af49250002d8)

5 kyu

Create a method called "power" that takes two integers and returns the value of the first argument raised to the power

of the second. Return nil if the second argument is negative.

Note: The ** operator has been disabled.

PROBLEM
-------
- input: 2 integers
- output: integer that is the value of int1 to the power of int2

- return nil if int2 is < 0
- cannot use **

EXAMPLES
--------
(2, 3)
-> 2 ** 3 -> 8
-> 2 * 2 * 2

(8, -2)
-> nil

(-5, 3)
-> -125
-> -5 * -5 * -5

DATA STRUCTURES
---------------
- array?

ALGORITHM
---------
- return nil if int2 < 0
- create result counter to keep track of multiplication
- find the result
  - call times method on int2
  - result *= int1
- return the result
=end

def power(int1, int2)
  return nil if int2 < 0

  result = 1
  int2.times {result *= int1}
  result
end

p power(2, 3) == 8

p power(10, 0) == 1

p power(-5, 3) == -125

p power(-4, 2) == 16

p power(10, 0) == 1

p power(2, 3) == 8

p power(3, 2) == 9

p power(-5, 3) == -125

p power(-4, 2) == 16

p power(8, -2) == nil