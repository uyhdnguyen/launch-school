=begin
Imagine a sequence of consecutive even integers beginning with 2.
The integers are grouped in rows,
with the first row containing one integer,
the second row two integers,
the thrid row three integers, and so on.
Given an integer representing the number of a particular row,
return an integer represnting the sum of all the integers in that row.

# PROBLEM
---------
- sequence of consecutive even integers begins with 2
- first row have 1 integer
- second row have 2 integers and so on
- given integer represent row's number
- return the sum of the row

1. inputs are integer?
2. inputs always greater than 1?
3. what is the sequence of consecutive even integers

input: integer
output: integer
rules:
  - explicit:
    - even sequence starts with 2
    - rows number == how many integers in that row
    - integers are grouped in rows
  - implicit:
    - rows numbers always greater than 1

# EXAMPLE/ TEST CASES
---------------------
  2
  4, 6
  8, 10, 12
  14, 16, 18, 20
  22, 24, 26, 28, 30

  p sequence_even_integer(3) == 30

# DATA STRUCTURES
-----------------




=end