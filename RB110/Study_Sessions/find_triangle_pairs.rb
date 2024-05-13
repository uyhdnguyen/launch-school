## Given 2 two arguments of an array of numbers and a number, find all the pairs that results in the forming a triangle with the number. 

## Note: To determine if three numbers form a triangle you have touse the Triangle Inequality Theorem, which states that the sum of two side lengths of a triangle is always greater than the third side. If this is true for all three combinations of added side lengths, then you will have a triangle. -- Uy

# Test cases
# puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
# puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
# puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
# puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]

# Implement function that finds all fibonacci slices in a given array of integers. A Fibonacci slice is a sequence where every number after the first two is the sum of the two preceding ones. The minimum length is 3. -- Jung

# Test cases
# puts find_fibonacci_slices([1, 1, 2, 3, 5, 8]).inspect # [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
# puts find_fibonacci_slices([2, 4, 7, 11, 18]).inspect # [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
# puts find_fibonacci_slices([5, 5, 10, 15, 24, 40]).inspect # [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
# puts find_fibonacci_slices([1, 2, 4, 6, 10, 16]).inspect # [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
# puts find_fibonacci_slices([10, 22, 33, 43, 56]).inspect # []

=begin
PROBLEM
-------
- input: array of numbers and a number
- output: nested array contains all pairs that results in forming a triangle with the number

- how to determine if 3 numbers form a triangle
  - sum of two side lengths of a triangle is greater than third side
  - if all 3 combinations of side lengths -> valid triangle

- find all pairs that results in forming a triangle with the number
- NO EMPTY INPUT

EXAMPLES
--------
[2, 3, 4, 5], 7

-> [ [ 3, 5 ], [ 4, 5 ] ]
(3, 5, 7) , (4, 5 , 7)

3, 5, 7

3 + 5 > 7
5 + 7 > 3
3 + 7 > 5


[1, 2, 3, 4], 10
-> []

DATA STRUCTURES
---------------
- HELPER METHOD `valid_triangle?`

- array contains all of the pairs that can form a triangle with the number

ALGORITHM
---------
- `valid_triangle?`
 - input: array of 3 sides of triangle
 - output: true/false if they can be formed triangles

 - find 3 pairs of given arr
  - combination(2)
 - find sum of given arr
  - sum |
 - find the last side
  - sum - combination.sum
 - compare the sum of combination and the last side
  - if sum of combinations > last side -> return false
 - always return true

=end

def valid_triangle?(arr)
  total_length = arr.sum

  pairs = arr.combination(2).to_a.map(&:sum)

  pairs.each do |pairs|
    return false if pairs <= total_length - pairs
  end

  true
end

def find_triangle_pairs (arr, num)

  pairs = arr.combination(2).to_a

  pairs.select{ |pair| valid_triangle?(pair + [num]) }

end

# # Test cases
puts find_triangle_pairs([2, 3, 4, 5], 7).inspect # [ [ 3, 5 ], [ 4, 5 ] ]
puts find_triangle_pairs([1, 2, 3, 4], 10).inspect # []
puts find_triangle_pairs([7, 10, 12, 15], 9).inspect # [ [ 7, 10 ], [ 7, 12 ], [ 7, 15 ], [ 10, 12 ], [ 10, 15 ], [ 12, 15 ] ]
puts find_triangle_pairs([8, 2, 5, 6, 3], 4).inspect # [ [ 8, 5 ], [ 8, 6 ], [ 2, 5 ], [ 2, 3 ], [ 5, 6 ], [ 5, 3 ], [ 6, 3 ] ]

