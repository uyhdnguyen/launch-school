=begin
There is an array with some numbers. All numbers are equal except for one. Try to find it!

find_uniq([ 1, 1, 1, 2, 1, 1 ]) == 2
find_uniq([ 0, 0, 0.55, 0, 0 ]) == 0.55

It’s guaranteed that array contains at least 3 numbers.

The tests contain some very huge arrays, so think about performance.

PROBLEM
-------
- input: array of numbers(integers, floats)
- output: number(integers, floats) that is different from the rest

- given an array with numbers
- all numbers are equal but one
- arr always contains 3 numbers
   arr.size >= 3

EXAMPLES
--------
[ 1, 1, 1, 2, 1, 1 ]
-> 2

[ 0, 0, 0.55, 0, 0 ]
-> 0.55

DATA STRUCTURES
---------------
- variable to keep track of current element

ALGORITHM
---------
- create a variable to keep track of current element
  - `unique_el` assigns to the first element of `arr`
- find the unique value
  - iterate through given `arr` index(2 -> last)
    - reassign `unique_el` to current element if they are different
- return the current element

=end

# def find_uniq(arr)
#    unique_el = arr.first

#   (2...arr.size).each do |idx|
#     return arr[idx] if unique_el != arr[idx]
#   end
# end

# def find_uniq(arr)
#   arr.uniq.each { |x| return x if arr.count(x) == 1 }
# end

def find_uniq(arr)
  sorted_arr = arr.sort

  if sorted_arr[0] == sorted_arr[1]
    return arr.last
  else
    return arr.first
end

p find_uniq [1,1,1,1,0]
p find_uniq [ 1, 1, 1, 2, 1, 1 ]
p find_uniq [ 0, 0, 0.55, 0, 0 ]