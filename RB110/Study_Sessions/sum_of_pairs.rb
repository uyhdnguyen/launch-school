=begin
Given a list of integers and a single sum value, return the first two values (parse from the left please) in order of appearance that add up to form the sum.

If there are two or more pairs with the required sum, the pair whose second element has the smallest index is the solution.

PROBLEM
-------
- input: list of integers(array), sum value(integer)
- output: pair of integer add up to the sum

- return the first pair if there are multiple pairs
- no empty array


EXAMPLES:
---------
[11, 3, 7, 5], 10
11,3 11,7 11,5
3,7 3,5
7,5

->[3,7]

[4, 3, 2, 3, 4], 6
[4, 2] [3, 3] [2, 4]
-> [4, 2]

[10, 5, 2, 3, 7, 5], 10
10,5 10,2 10,3 10,7 10,5

[5,5] [3,7]
-> [5,5]

DATA STRUCTURES:
----------------
- variable to keep track of current sum

ALGORITHM
---------
- create variable to keep track of current sum
  - `current_sum`
- find all  of the subarrays containing 2 elements(pair)
  - iterate through elements of the given array
    - index(0 -> last - 1) (idx)
  - iterate from (idx + 1) - > last
  - return the pair for each iteration
  - find the sum of current pair
  - return the current pair if `current_sum` is equal to `target_sum`
=end

# def sum_of_pairs(arr, target_sum)
#   pairs = {}

#   (0...arr.size - 1).each do |idx1|
#     (idx1 + 1...arr.size).each do |idx2|
#       pair = [arr[idx1], arr[idx2]]
      
#       current_sum = pair.sum

#       pairs[idx2] = pair if current_sum == target_sum
#     end
#   end

#   return nil if pairs.empty?
#   pairs.sort.first.last
# end

def sum_of_pairs(arr, target_sum)
  result = {}

  arr.each do |num|
    required_num = target_sum - num

    return [required_num, num] if result[required_num]

    result[num] = true
  end

  nil
end

p sum_of_pairs [10, 5, 2, 3, 7, 5], 10
p sum_of_pairs [1, -2, 3, 0, -6, 1], -6
p sum_of_pairs [20, -13, 40], -7
