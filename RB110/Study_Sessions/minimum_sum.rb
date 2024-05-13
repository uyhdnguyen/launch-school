=begin

# Write a method that takes one argument: an array of integers.
# The method should return the minimum sum of 5 consecutive
# numbers in the array. If the array contains fewer than 5
# elements, the method should return nil.

PROBLEM
-------
input: array of integers
output: integer that respresent the minimum sum of 5 consecutive numbers

rules:
- if arr.size < 5 - > return nil
- sum of 5 consecutive numbers
- array can contain posistive and negative integers

EXAMPLES
--------
[1, 2, 3, 4] -> nil
[1, 2, 3, 4, 5, 6] - > 15
[-1, -5, -3, 0, -1, 2, -4] -> -10

DATA STRUCTURES
---------------
- array contains consecutive subarrs of 5 integers
- array to contain the sum of all subarrs

ALGORITHM
---------
- return nil if the size of given array is < than 5
  - return nil if arr.size < 5
- create an array to contains all of the subarrs
  - `consecutive_arr`
- create array to contain the sum of all subarrs
  - `sum`
- find all of the consecutive subsarray of 5 numbers
  - iterate through each element of the given arr from 0 index to last index
    - (0...arr.size)
    - the range of 5
    - add the subarrs to the `consecutive_arr`
    - get the sum of subarrs
    - return sum of subarrs to `sum`

- select & return the smallest sum form `sum`
=end

def minimum_sum(arr)
  return nil if arr.size < 5

  (0...arr.size - 5).each_with_object([]) do |idx, consecutive_arr|
    consecutive_arr << (arr[idx, 5]).sum
  end
  .min
end

p minimum_sum([1, 2, 3, 4]) == nil
p minimum_sum([1, 2, 3, 4, 5, 6]) == 15
p minimum_sum([55, 2, 6, 5, 1, 2, 9, 3, 5, 100]) == 16
p minimum_sum([-1, -5, -3, 0, -1, 2, -4]) == -10