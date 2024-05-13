=begin
42. Sort Arrays (Ignoring Case)

(https://www.codewars.com/kata/51f41fe7e8f176e70d0002b9/train/ruby)

6 kyu

Sort the given strings in alphabetical order, case insensitive. For example:

["Hello", "there", "I'm", "fine"] --> ["fine", "Hello", "I'm", "there"]

["C", "d", "a", "B"]) --> ["a", "B", "C", "d"]

PROBLEM
-------
- given string in alphabetical order
- case insensitive

EXAMPLES
--------
["Hello", "there", "I'm", "fine"]
["fine", "Hello", "I'm", "there"]

["C", "d", "a", "Ba", "be"]
c, a, d, ba

["a", "Ba", "be", "C", "d"]

["CodeWars"]
["CodeWars"]

DATA STRUCTURES
---------------
- input: array contains words

- helper method to check for both words chars by chars
- array contains all of the sorted words

- output: array contains words

ALGORITHM
---------
- create helper method to check for both words chars by chars
  - input: 2 strings that each contains 1 word
  - output: -1 0 1

  - iterate through all chars in longer string
-----------------------------------------------------------------
- create duplicated array contains all of the sorted words
  - dup_arr = arr.dup
- create a flag to check if still need to sort array
  - is_done = false
- create a loop to keep checking for each element in the array
  - transform given string into array of words down
=end

def sort_me(arr)
  arr.sort_by(&:downcase)
end

p sort_me(["Hello", "there", "I'm", "fine"]) == ["fine", "Hello", "I'm", "there"]

p sort_me(["C", "d", "a", "Ba", "be"]) == ["a", "Ba", "be", "C", "d"]

p sort_me(["CodeWars"]) == ["CodeWars"]
