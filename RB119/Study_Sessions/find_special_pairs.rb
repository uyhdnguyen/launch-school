=begin
Implement a function that finds all pairs of numbers whose odd indexed position
in the original array is greater than 5 and whose even indexed position
in the original array is less than 5.
=end

# Test cases
# puts find_special_pairs([2, 6, 1, 7, 4, 10]).inspect # [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
# puts find_special_pairs([4, 9, 2, 6, 3, 11, 4]).inspect # [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]

#                          0. 1.  2. 3
# puts find_special_pairs([5, 12, 3, 8]).inspect # [ [ 3, 8 ] ]
# puts find_special_pairs([7, 4, 6, 5]).inspect # []
# puts find_special_pairs([1, 7, 2, 8, 3, 9]).inspect # [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]

# - PROBLEM
#   - Input: array of integers
#   - Output: nested array of integers

#   - Rules:
#     - Explicit:
#       - find all pairs of numbers whose odd indexed position > 5
#       - find all pairs of number whose odd indexed position < 5

#     - Implicit:
#       - only need one index in pair > 5
#       - only need one index in pair < 5

# - EXAMPLES AND TEST CASES
#   - [2, 6, 1, 7, 4, 10]
#      0  1  2  3  4  5

#   [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]

# - DATA STRUCTURE
#   - Input: array of integer
#   - Output: 
#   - Need to have an array that can contain each pair
#   - Each pair is placed in an array

# - ALGORITHM
#   - create an empty array that contain all required pairs
#   - iterate through given array and create all subarrays that contain all pairs (create helper method)
#   - check if any number that theirs index is greater than 5 or less than 5 ( create helper method)
#   - push required pairs to the result array
#   - return the result 
# =end

def find_special_pairs(arr)
  all_pairs = []

  # First, find all pairs that have even index of original array at the first element position, and odd index of original array at second element position
  0.step(arr.length - 2, 2) do |even|
    
    (even + 1).step(arr.length - 1, 2) do |odd|
      all_pairs << [arr[even], arr[odd]]
    #   all_pairs.push([arr[even], arr[odd]])
    end
  end

  # Now, filter the pairs for those that meet the conditions( pairs have value of even index < 5 and value of odd index > 5)

  result = all_pairs.select { |pair| pair[0] < 5 && pair[1] > 5 }
end

# # Test cases
puts find_special_pairs([2, 6, 1, 7, 4, 10]).inspect # [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
puts find_special_pairs([4, 9, 2, 6, 3, 11, 4]).inspect # [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]
puts find_special_pairs([5, 12, 3, 8]).inspect # [ [ 3, 8 ] ]
puts find_special_pairs([7, 4, 6, 5]).inspect # []
puts find_special_pairs([1, 7, 2, 8, 3, 9]).inspect # [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]
