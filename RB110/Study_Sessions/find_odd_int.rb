=begin
Given an array of integers, find the one that appears an odd number of times.

There will always be only one integer that appears an odd number of times.

Examples
[7] should return 7, because it occurs 1 time (which is odd).
[0] should return 0, because it occurs 1 time (which is odd).
[1,1,2] should return 2, because it occurs 1 time (which is odd).
[0,1,0,1,0] should return 0, because it occurs 3 times (which is odd).
[1,2,2,3,3,3,4,3,3,3,2,2,1] should return 4, because it appears 1 time (which is odd).

PROBLEM
-------
- INPUT:
- OUTPUT:

- given an array of integers
- find integer that appears an odd number of times
- there will always be one result
- there is not empty array

EXAMPLES
--------
[7] 
-> 7 (1)

[0]
-> 0

[1,1,2]
-> 2 (1)

[0,1,0,1,0]
-> 0 (3)

[1,2,2,3,3,3,4,3,3,3,2,2,1]
-> 4 (1)

DATA STRUCTURES
---------------
- array contains all of the uniq numbers
- hash to get the unique numbers(k) and the count(v)

ALGORITHM
---------
- create array contains all of the uniq numbers
  - `unique_numbers`
- create hash to get the unique numbers(k) and the count(v)
  - `result`
- find all of the count for each unique number
  - iterate through all of the elements in `unique_numbers`
  - push the counts and numbers to `result`
- return the key of the count that is odd
=end

# def find_it(arr)
#   result = {}
#   unique_numbers = arr.uniq

#   unique_numbers.each do |num|
#     result[num] = arr.count(num)
#   end

#   result.select { |_, count| count.odd?}.keys.first
# end

def find_it(arr)
  unique_numbers = arr.uniq

  unique_numbers.each do |num|
    return num if arr.count(num).odd?
  end

end

p find_it [1,2,2,3,3,3,4,3,3,3,2,2,1]