# Write a method that takes an Array of numbers, and returns an Array with
# the same number of elements, and each element has the running total from
# the original Array.

# Examples:

# running_total([2, 5, 13]) == [2, 7, 20]
# running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# running_total([3]) == [3]
# running_total([]) == []

# A running total is the sum of all values in a list up to and including
# the current element. Thus, the running total when looking at index 2 of
# the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total
# at index 3 is 47 (14 + 11 + 7 + 15).

=begin

- PROBLEM
  - Input: array of numbers
  - Output: array with the same number of elements

  - Rules:
    - Explicit:
      - Each element has the running total from the original array
      - Array has the same length of the orignial
      -
    - Implicit:
      - Return empty array if the original array is empty
      -

- EXAMPLES AND TEST CASES
  - running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]

- DATA STRUCTURE
  - Input: array
  - Output: array
  - Array? Hash? Combination?

- ALGORITHM
  - Create new empty array for the result
  - Push the first element of the original array to the result
  - Iterate through the original array
    - Push
=end

# def running_total(array)
# sum = 0
# array.map {|el| sum += el}
# end

# def running_total(array)
#   sum = 0
#   array.each_with_object([]) { |el,arr| arr << sum += el }
# end

def running_total(array)
  sum = 0
  array.reduce([]) { |arr, num| arr << sum += num }
end

p running_total([2, 5, 13])