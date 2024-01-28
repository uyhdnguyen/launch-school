# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
PROBLEM

1. What is palindrome?
  string = string.reverse
2. How to deal with empty string?
  return empty string
3. What is the return value?
  return new string?
4. All inputs are string?
  yes
5. Keep the same format for case sensitive?
  yes

- input: string
- output: new array contain palindrome substrings
- rules
  - explicit requirements:
    - method name is palindrome_substrings
    - find all of the substrings which are palindromes
    - palindromes are case sensitive : ada != ADA
  - implitcit requirements:
    - empty string, return empty array
    - no palindrome, return empty array

EXAMPLES/TEST CASES

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

DATA STRUCTURE

- input: string
- output: array of substrings
- process: array

ALGORITHM

palindrom_substrings
====================
- convert the string into substrings and assign it to `substrings`
- create an empty array called result that will contain all substrings that are palindrome
- iterate through `substring_array` to check each substring
  - if substring is_palindrome?
    - append it to result
- return the result

substring_array
===============
# P
given 'hello'
find substring with length greater 2
return the substrings array

input: string
output: array
rules: find substrings with length greater than 2

# E
- hello (size = 5)
 - he, hel, hell, hello (start =0, length 5)
 - el, ell, ello (start = 1, length 4)
 - ll, llo
 - lo

# D
- input: string
- output: array of substring
- process: array

# A
- create 'result' to an empty array that will contain all of the substring
- create 'starting_index' to integer 0
- iterate through input string starting from index 0
  - create sub_string_size to integer 2 that start slicing from length of 2
  - iterate through the rest of the string
    - adding each substring using from start_index + the length of substring
    - increase the length of substring by 1
  - increase starting_index by 1
- return the result

is_palindrome?
===============
# P
given a string
check if the string is equal its reversion

input: string
output: true/false

# E
'ada' == 'ada'
'Ada' != 'adA'

# D
input: string
output: true/false

# A
- convert string using reverse method
- check if converted string == original string
=end

def substring_array(str)
  result = []
  starting_index = 0

  while starting_index <= str.size - 2 do
    # substring_length = str.size

  # Option 1
    # loop do
    #   result << str[starting_index, substring_length]
    #   substring_length -= 1
    #   break if substring_length <= 2
    # end

  # Option 2
    substring_length = 2

    while substring_length <= str.size - starting_index do
      result << str[starting_index, substring_length]
      substring_length += 1
    end

    starting_index += 1
  end

  result
end

def is_palindrome?(str)
  str == str.reverse
end

def palindrome_substrings(string)
  substrings = substring_array(string)
  result = []

  substrings.each do |substring|
    result << substring if is_palindrome?(substring)
  end

  result
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []
