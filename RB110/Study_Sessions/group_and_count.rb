=begin
Your goal is to write the group_and_count method, which should receive and array as unique parameter and return a hash. Empty or nil input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of each value.

Example usage:

PROBLEM
-------
- input: array 
- ouput: hash

- method called `group_and_count`
- if array is empty/ nil input -> return nil
- unique value of array is key
- counts of each are values

EXAMPLES
--------
[0,1,1,0]
-> {0=>2, 1=>2}

DATA STRUCTURES
---------------
- HASH per requirements

ALGORITHM
---------
- create `result` per requirements
- transform given array to contains only unquie values
  - `unique_values`
- find the counts for each value
  - iterate through all of the elements in `unique_values`
  - find the count
    - `count` method
  - return the counts to `result`
- return the `result`
=end

def group_and_count(arr)
  result = {}
  unique_values = arr.uniq

  unique_values.each do |ele|
   result[ele] = arr.count(ele)
  end
  result
end

p group_and_count [0,1,1,0]