=begin
# Write a method that takes an array of integers and returns the
# two numbers that are closest together in value.

PROBLEM
-------
- input: array of integers
- output: array of 2 integers that are closest in value

rules:
- positive integers
- no empty arr
- find pairs of integers that their absoluted subtraction is min
- need to maintain order

EXAMPLES
--------
[5, 25, 15, 11, 20] -> [15,11]
[19, 25, 32, 4, 27, 16] - > [25,27]
[12, 7, 18] -> [12, 7]

5, 25, 15, 11, 20
5-25
5-15
5-11
5-20
25-15
25-11
25-20
15-11
15-20
11-20

DATA STRUCTURES
---------------
- hash contains all of the sub-arrs in which the deduction is key and subarray is value

ALGORITHM
---------
- create deduction method
  - find deduction of first element and second element
  - return its absolute value
=====================================================================
- create a hash to hold all of the sub-arrs
  - `all_pairs`
- find all pairs from given arr
  - iterate through all elements of given arr (0 index -> last index)
    - iterate from the next index -> last index
      - return the sub-arrays(deduction) to `all_pairs`
- select min key
- return the value of that key

=end
def get_abs_diff(a)
  (a.first - a.last).abs
end

def closest_numbers(arr)
  all_pairs = (0...arr.size).each_with_object({}) do |idx1, pairs|
    (idx1 + 1...arr.size).each do |idx2|
      pairs[get_abs_diff([arr[idx1], arr[idx2]])] = [arr[idx1], arr[idx2]]
    end
  end

  # all_pairs[all_pairs.keys.min]
  all_pairs.min_by { |diff, _| diff }.last
end

p closest_numbers([5, 25, 15, 11, 20]) == [15, 11]
p closest_numbers([19, 25, 32, 4, 27, 16]) == [25, 27]
p closest_numbers([12, 7, 18]) == [12, 7]