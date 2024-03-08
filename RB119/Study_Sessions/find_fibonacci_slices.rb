=begin
PROBLEM
-------
Input: array with integeres
Output: subarrays with integers
Rules: find all subarrays that are fibonacci slices meaning every number after the first two is the sum of the two preceding ones
minimum subarray length is 3

EXAMPLES
--------
[1, 1, 2, 3, 5, 8]

-> [[1, 1, 2], 
[1, 1, 2, 3], 
[1, 1, 2, 3, 5], 
[1, 1, 2, 3, 5, 8], 
[1, 2, 3], 
[1, 2, 3, 5], 
[1, 2, 3, 5, 8], 
[2, 3, 5], 
[2, 3, 5, 8], 
[3, 5, 8]]

DATA STRUCTURES
---------------
- array contains sub-array that are fib slices

ALGORITHM
---------
- create helper method `is_fib_slices?`
  - input: array that is sub-array
  - output: true/false if that is fib slices

  - check all of elements in given sub-array
    - iterate through all element from (0 -> last - 3)
      - if sub-array element at index - 2 + sub-array element at index - 1 = sub-array element at current index
----------------------------------------------------------------
- create all of sub-array
  - iterate from idx(0, last.size - 3)
    - create range from (3 -> size of array - idx)
      - return all of sub-arrays
- return only sub-arrays that are fib slices

=end

def is_fib_slices?(arr)
  (2..arr.size - 1).all? do |idx|
    arr[idx - 2] + arr[idx - 1] == arr[idx]
  end
end

def find_fibonacci_slices(arr)
  (0..arr.size - 3).each_with_object([]) do |idx, substrings|
    (3..arr.size - idx).each do |range|
      substring = arr[idx, range] 
      substrings  << substring if is_fib_slices?(substring)
    end
  end
end

p find_fibonacci_slices([1, 1, 2, 3, 5, 8]) == [[1, 1, 2], [1, 1, 2, 3], [1, 1, 2, 3, 5], [1, 1, 2, 3, 5, 8], [1, 2, 3], [1, 2, 3, 5], [1, 2, 3, 5, 8], [2, 3, 5], [2, 3, 5, 8], [3, 5, 8]]
p find_fibonacci_slices([2, 4, 7, 11, 18]) == [[4, 7, 11], [4, 7, 11, 18], [7, 11, 18]]
p find_fibonacci_slices([5, 5, 10, 15, 24, 40]) == [[5, 5, 10], [5, 5, 10, 15], [5, 10, 15]]
p find_fibonacci_slices([1, 2, 4, 6, 10, 16]) == [[2, 4, 6], [2, 4, 6, 10], [2, 4, 6, 10, 16], [4, 6, 10], [4, 6, 10, 16], [6, 10, 16]]
p find_fibonacci_slices([10, 22, 33, 43, 56]) == []
