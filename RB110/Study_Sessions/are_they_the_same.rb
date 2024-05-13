=begin
Given two arrays a and b write a function comp(a, b) (orcompSame(a, b)) that checks whether the two arrays have the "same" elements, with the same multiplicities (the multiplicity of a member is the number of times it appears). "Same" means, here, that the elements in b are the elements in a squared, regardless of the order.

PROBLEM
-------
- input:
- output: true/false

- given 2 arrays `a` and `b`
- check if 2 arrays
  - the elements in b are the elements in a squared
- order does not matter
- method is called `comp`
- given arrs have all elements are not in ordered
- given array might be empty -> return false

EXAMPLES
--------
a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
-> true

a = [121, 144, 19, 161, 19, 144, 19, 11]  
b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]
-> false

DATA STRUCTURES
---------------
- array to keep all of the transformed element of first array

ALGORITHM
---------
- transform every element in `arr1` to its squared values
  - `map`, `squared_arr`
- return true if `squared_arr` minus the `arr2` is empty
- return false 
=end

def comp(arr1, arr2)
  return false if arr1.empty? || arr2.empty?

  squared_arr = arr1.map { |num| num * num }

  return true if (squared_arr - arr2).empty?

  false
end

def comp(arr1, arr2)
  return false if arr1.empty? || arr2.empty?

  squared_arr = arr1.map { |num| num * num }.sort

  arr2.sort == squared_arr
end

a = [121, 144, 19, 161, 19, 144, 19, 11]  
# b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]
b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

p comp a,b