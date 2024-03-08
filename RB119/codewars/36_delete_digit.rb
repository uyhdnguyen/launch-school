=begin
36. Delete a Digit

(https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)

6 kyu

Task

Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.

Example

For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output

[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer

PROBLEM
-------
- int
- find the meximum number by deleting 1 digit

EXAMPLES
--------
152 -> 52
52
12
15

1001 -> 101
001
101
101
100

10 -> 1

DATA STRUCUTRES
---------------
- input: integer

- array contains all of the sub-arrays for combinations

- ouput: integer that has less than input one digit

ALGORITHM
---------
- create an array contains all of the sub-arrays for combinations
  - combinations | []
- transform given int to string
  - transformed_num | to_s
- find all possible combinations
  - iterating through transformed_num
    - idx (0 -> last), each
  - return the combination to combinations
    - transformed_num[0...idx] + transformed_num[idx + 1..last], <<
- transform combination in combinations into integers
  - map(&:to_i)
- return the max value in combinations
=end

def delete_digit(num)
  combinations = []
  transformed_num = num.to_s

  (0...transformed_num.size).each do |idx|
    combination = transformed_num[0...idx] + transformed_num[idx + 1...transformed_num.size]

    combinations << combination
  end

  combinations.map(&:to_i).max
end

p delete_digit(152) == 52

p delete_digit(1001) == 101

p delete_digit(10) == 1