=begin
You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000

PROBLEM
-------
- input: arr of integers
- output: integer that represents the numbers of pairs in the given arr

- return 0 if the array is empty || arr has one value
- return 2 if given array is [0, 0, 0, 0] -> 2 pairs of 0
- values in arrray is 0 < values < 1000

EXAMPLES
--------
[1, 2, 5, 6, 5, 2] -> 2 ( pairs of 2 and pairs of 5)
1-2 1-5 1-6 1-5 1-2
2-5 2-6 2-5 2-2
5-6 5-5 5-2
6-5 6-2
5-2

[1, 2, 2, 20, 6, 20, 2, 6, 2] -> 4 ( 2 pairs of 2, pairs of 6, pairs of 20 )

DATA STRUCTURES
---------------
- count to keep tracks of numbers of pairs
----------------------------------------------------
- array to contains all of the the pairs that are in the given array
- helper method to check for pairs

ALGORITHM
---------
- create array to contains all of the the pairs that are in the given array
  - `pairs`
- find all of the pairs in given array
  - iterate through all of the numbers in given array index(0 to -2) idx
    - iterate through all of the numbers in given array index(idx + 1 to -1)
    - return only the pairs if the first element == last element
-return the count from `pairs`
=end

# OPTION 1
# def find_all_pairs(arr)
#   pairs = []
  
#   (0..arr.size - 2).each do |idx1|
#     (idx1 + 1...arr.size).each do |idx2|
#       pairs << [arr[idx1], arr[idx2]] if arr[idx1] ==  arr[idx2]
#     end
#   end

#   pairs.size
# end

# OPTION 2
def find_all_pairs(arr)
  count = 0
  
  (0..arr.size - 2).each do |idx1|
    (idx1 + 1...arr.size).each do |idx2|
      count += 1 if arr[idx1] ==  arr[idx2]
    end
  end

  count
end
p find_all_pairs [1, 2, 5, 6, 5, 2] 