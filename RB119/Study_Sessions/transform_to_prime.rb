=begin

PROBLEM
-------
- input: array of integers
- output: integer that is the min diff from current sum to next prime number

- min number to be insereted into an array
- sum of all elements of list should equal to the closest prime number
- arr size is >= 2
- arr contains positive integers
- could have duplicates
- prime number
  - divisible by 1 and itself
  - greater than 0

EXAMPLES
--------
(3,1,2) 
=> return (1)

DATA STRUCTURES
---------------
- helper `is_prime?` to check if number is prime
- counter to get the diff between current sum and prime number

ALGORTHM
--------
- `is_prime?` method
  - input: integer that represent `current_sum`
  - output: true/false

  - create a range from 2 to given number - 1
    - `any?` method
      - given number % num in range
      - return false
  - return true 
------------------------------------------------------
- find the current sum of given array
  - `current_sum`
- find the closest prime number from `current_sum`
  - create a counter to increase current_sum to next prime number
    - `counter`
  - create a loop and keep increasing the `current_sum` until reaching to prime number
  - return the prime number
- return the difference between prime number and `current_sum`
=end

def is_prime?(num)
  (2..num - 1).none? { |n| num % n == 0}
end

def minimum_number(arr)
  current_sum = arr.sum

  counter = 0
  prime_number = 0

  loop do
    prime_number = current_sum + counter

    counter += 1
    break if  is_prime?(prime_number)
  end

  prime_number - current_sum
end

p minimum_number [3,1,2] == 1
p minimum_number [2,12,8,4,6] == 5
p minimum_number [50,39,49,6,17,28] == 2
