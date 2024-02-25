=begin
[Train: Simple Fun #79: Delete a Digit \| Codewars](https://www.codewars.com/kata/5894318275f2c75695000146/train/ruby)
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
P: 
- write a method that takes an int as an arg
- find the max number that we can get by deleting exactly 1 number from the arg int
E:

p delete_digit(152) == 52
52, 12, 15 => 52

p delete_digit(1001) == 101
01,101 => 101

p delete_digit(10) == 1
1, 0 => 1

DS:
input: int
middle: array
output: int

N:
delete_at (counter)
=end

# ALGORITHM
# - transform given number into array of string digits 
#   - `combinations` array  -> to_s, chars method
# - find all combination of the size of array - 1
#   - combination(combinations.size - 1)
# - transform all combination back into integers
#   - `join`, `to_i` method
# - select and return  maximum number from the array
#   - `max` method

def delete_digit(number)
  combinations = number.to_s.chars

  combinations
  .combination(combinations.size - 1) # because we delete 1 digit
  .to_a
  .map(&:join)
  .map(&:to_i)
  .max
end

# A:
# - convert the arg int into a string
# - iterate over this string
#   - with each iteration,add to `result` Array   
#     - WITHOUT the current index 
# - can save the array to `temp` first
# - taking advantage of index, remove from each array the element at the current index == counter
# - increase the counter with each loop iteration

# - now transform the strings in the `result` array into numbers

# - find out the max number

def delete_digit(int)
  arr = int.digits.reverse
  result = []

  counter = 0
  loop do
    break if counter > arr.size - 1
    p temp = arr.reject.with_index { |e, i| i == counter }
    result << temp.join.to_i
    counter += 1
  end

  result.max
end

p delete_digit(152) #== 52
p delete_digit(1001) #== 101
p delete_digit(10) == 1

