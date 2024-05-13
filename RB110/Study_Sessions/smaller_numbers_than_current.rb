=begin

# Given an array of numbers, for each number find out how many numbers
# in the array are smaller than it. When counting numbers, only count
# unique values. That is, if a given number occurs multiple times in
# the array, it should only be counted once.

PROBLEM
-------
input: array of numbers
output: array contains integers
        - each integer represents total smaller numbers

rules:
- for each number
  - find total numbers in the array are smaller
  - ingnore duplicates, only count unique values

EXAMPLES
--------
[8,1,2,2,3] -> [3, 0, 1, 1, 2]
[7,7,7,7] - > [0 ,0 ,0 ,0]
[1] -> [0]

DATA STRUCTURES
---------------
- array to contains counts for smaller numbers

ALGORITHM
---------
- create an array to hold all of the counts
  - `counted_arr`
- create an array of unique values
  - `unique_vals`
- create a count to keep track of the count
  - `count` = 0
- find total smaller numbers in `unique_vals` comparing to the element in the given arr
  - iterate through each element of the given arr
    - reset the count to 0
    - iterate through each element of `unique_vals`
      - if element of given array is > element of `unique_vals`
        - increase the count by 1
        - return the count
- return the `counted_arr`
=end

def smaller_numbers_than_current(arr)
  counted_arr = []
  unique_vals = arr.uniq

  arr.each do |num|
    count = 0
    unique_vals.each do |n|
      count += 1 if num > n
    end
    counted_arr << count
  end

  counted_arr
end

p smaller_numbers_than_current([8,1,2,2,3]) == [3, 0, 1, 1, 2]
p smaller_numbers_than_current([1,4,6,8,13,2,4,5,4]) == [0, 2, 4, 5, 6, 1, 2, 3, 2]
p smaller_numbers_than_current([7,7,7,7]) == [0,0,0,0]
p smaller_numbers_than_current([6,5,4,8]) == [2, 1, 0, 3]
p smaller_numbers_than_current([1]) == [0]