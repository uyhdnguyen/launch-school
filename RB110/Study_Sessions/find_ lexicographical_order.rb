=begin
59. Which are in?
(https://www.codewars.com/kata/550554fd08b86f84fe000a58)
6 kyu
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are
substrings of strings of a2.
#Example 1: a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns ["arp", "live", "strong"]

#Example 2: a1 = ["tarp", "mice", "bull"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
returns []
Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r
 must be without duplicates.
Don't mutate the inputs.
=end

=begin


- PROBLEM
  - Input: arrays that contains strings
  - Output: array that contains all of the strings from a1, in which the strings are part of correlated string from a2

  - Rules:
    - two arrays a1 and a2
    - lexicographical order definition
    - return `r` array which are substrings of strings of a2

- EXAMPLE
  - a1 = ["arp", "live", "strong"]
  - a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
  - r = ["arp", "live", "strong"]

  - a1 = ["tarp", "mice", "bull"]
  - a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
  - returns []

- DATA STRUCTURE
  - array since the return value is an array

- ALGORITHM
  - create an array to contain all of the lexicographical order String
  - find if string in a2 contains string in a1
    - check if each string in a1 is included in one of the strings in a2
      - if yes, push it to the result Array
  - return the result array
=end

def find_lexicographical_strings(arr1, arr2)
  result = []

  arr1.each do |word1|
    arr2.each do |word2|
      result << word1 if word2.include?(word1)
    end
  end

  result.uniq
end

a1 = ["arp", "live", "strong"]
a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

p find_lexicographical_strings(a1, a2) == ["arp", "live", "strong"]
