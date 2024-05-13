=begin
26. Mean Square Error

(https://www.codewars.com/kata/51edd51599a189fe7f000015/train/ruby)

Complete the function that

accepts two integer arrays of equal length

compares the value each member in one array to the corresponding member in the other

squares the absolute value difference between those two values

and returns the average of those squared absolute value difference between each member pair.

Examples

[1, 2, 3], [4, 5, 6] --> 9 because (9 + 9 + 9) / 3

[10, 20, 10, 2], [10, 25, 5, -2] --> 16.5 because (0 + 25 + 25 + 16) / 4

[-1, 0], [0, -1] --> 1 because (1 + 1) / 2


PROBLEM
-------
- input: 2 array contains integers of equal length
- output: integer that is the average of all of squared absolute difference

- compares each element from arr1 to arr2
- square the difference between the 2 values
- there are no empty input
- use float number for the average'

EXAMPLES
--------
[1, 2, 3], [4, 5, 6]
[3, 3, 3]
[9, 9, 9]
-> 9 

[10, 20, 10, 2], [10, 25, 5, -2]
[0, 5, 5, 4]
[0, 25, 25, 16]
-> 16.5

DATA STRUCTURES
---------------
- array contains all of the absolute different values
  - differences

ALGORITHM
---------
- create array contains all of the absolute different values
  - differences
- find the absolute different values
  - iterate through each elements in the arr1
    - each_with_index
  - find and return the absolute different values to differences
    - num in arr1 - arr2(idx)
    - <<
- find & transform the sum of differences to float
- return the average
  - sum of differences divide by the size of differences
=end

def solution(arr1, arr2)
  differences = []
  
  arr1.each_with_index do |num, idx|
    differences << (num - arr2[idx]).abs
  end

  differences.map{ |num| num ** 2}.sum.to_f / differences.size
end

p solution([1, 2, 3], [4, 5, 6]) == 9

p solution([10, 20, 10, 2], [10, 25, 5, -2]) == 16.5

p solution([-1, 0], [0, -1]) == 1