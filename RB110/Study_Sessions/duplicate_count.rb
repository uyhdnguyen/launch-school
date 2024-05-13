=begin

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

PROBLEM
-------
- input: string  uppercase and lowercase contains alphabetic characters and numeric digits
- output: integer represent the count of distinct chars

- case insensitive alphabetic characters and numeric digits
- find chars occur more than once
- no whitespce in given string
- no empty string

EXAMPLES
--------
"abcde" -> 0
no characters repeats more than once

"aabBcde" -> 2
'a' occurs twice and 'b' twice (`b` and `B`)

DATA STRUCTURES
---------------
- array contains unique chars

ALGORITHM
---------
- transform given string into array contains unique chars
  - `uniq_chars`
- transform given string into array contains all of chars
  - `all_chars`
- select all of the chars in `uniq_chars` that appear more than once
  - `count` > 2
  - create array for the count of each char in `uniq_chars`
    - `counted_arr`
- return the size of the selected array
=end

def duplicate_count(str)
  uniq_chars = str.downcase.chars.uniq

  all_chars =  str.downcase.chars

  counted_arr = uniq_chars.map {|chr| all_chars.count(chr)}

  counted_arr.select {|count| count > 1 }.size
end

p duplicate_count "abcde"
p duplicate_count "aabbcde"
p duplicate_count "aabBcde"
p duplicate_count "indivisibility"
p duplicate_count "Indivisibilities"
p duplicate_count "aA11"
p duplicate_count "ABBA"
