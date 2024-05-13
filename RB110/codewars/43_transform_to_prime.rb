=begin
FIRST TRY 19 MINS

43. Transform To Prime

(https://www.codewars.com/kata/5a946d9fba1bb5135100007c/train/ruby)

6 kyu

Task :

Given a List [] of n integers , find the minimum number to be inserted in a list, so that the sum of all elements of the list

should equal the closest prime number .

Notes

List size is at least 2 .

List's numbers will only have positives (n > 0) .

Repetition of numbers in the list could occur .

The newer list's sum should equal the closest prime number .

Input >> Output Examples

1- minimumNumber ({3,1,2}) ==> return (1)

Explanation:

Since , the sum of the list's elements equal to (6) , the minimum number to be inserted to transform the sum to prime

number is (1) , which will make *the sum of the List** equal the closest prime number (7)* .

2- minimumNumber ({2,12,8,4,6}) ==> return (5)

Explanation:

Since , the sum of the list's elements equal to (32) , the minimum number to be inserted to transform the sum to prime

number is (5) , which will make *the sum of the List** equal the closest prime number (37)* .

3- minimumNumber ({50,39,49,6,17,28}) ==> return (2)

Explanation:

Since , the sum of the list's elements equal to (189) , the minimum number to be inserted to transform the sum to prime

number is (2) , which will make *the sum of the List** equal the closest prime number (191)* .

=end

=begin
PROBLEM
-------
- List size is at least 2

- List's numbers will only have positives (n > 0)

- Repetition of numbers in the list could occur

- The newer list's sum should equal the closest prime number

- prime numbers are number cannot divide any numbers beside itself and 1
- prime number is > 1

- no empty input

EXAMPLES
--------
[3,1,2]
7 - 6 = 1
-> 1

[2,12,8,4,6]
37 - 32 = 5
-> 5

DATA STRUCTURES
---------------
- input: array of positive int

- helper method to check if given number is prime number `is_prime?`

- output: int that is the smallest number to insert into given arr to get to closest prime number

ALGORITHM
---------
- create helper method `is_prime?`
  - input: int 
  - ouput: true/false if num is prime number

  - create range from (2...num).all? {|n| num % n != 0}
-------------------------------------------------------
- find the sum of given array
  - sum
- create a counter to keep track of the loop
  - counter = 0
- create a loop with counter smallest_num
  - create prime_num = sum + counter
  - return prime_num if is_prime?(prime_num) is true
  - increase the counter
- return smallest number
  - prime_num - sum
=end

def is_prime?(num)
  (2...num).all? {|n| num % n != 0} && num > 1
end

def minimum_number(arr)
  sum = arr.sum

  counter = 0
  prime_num = 0

  loop do
    prime_num = sum + counter

    counter += 1
    break if is_prime?(prime_num)
  end

  prime_num - sum
end

p minimum_number([3,1,2]) == 1

p minimum_number([5,2]) == 0

p minimum_number([1,1,1]) == 0

p minimum_number([2,12,8,4,6]) == 5

p minimum_number([50,39,49,6,17,28]) == 2
