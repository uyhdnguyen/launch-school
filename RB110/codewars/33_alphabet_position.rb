=begin
FIRST TRY 11 MINS
33. Replace With Alphabet Position

(https://www.codewars.com/kata/546f922b54af40e1e90001da)

6 kyu

In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example

alphabet_position("The sunset sets at twelve o' clock.")

Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

PROBLEM
-------
- given a string
- replace every letter with its position in the alphabet
- if not in alphabet, don't return
- no empty string
- case insensitive

EXAMPLES
--------
"The sunset sets at twelve o' clock."
"20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

DATA STRUCTURES
---------------
- input: string

- array contains all chars
- hash contains the alphabet

- output: string that contains numbers, each number is its position in the alphabet

ALGORITHM
---------
- create hash contains the alphabet
  - alphabet | ('a'..'z').zip(1..26).to_h
- transform given string into lowercase chars array then into numbers
  - chars | downcase.scan(/[a-z]/).map
- transform chars into string
  - map(&:to_s)
- return the result string
=end

def alphabet_position(str)
  alphabet = ('a'..'z').zip(1..26).to_h

  str
  .downcase
  .scan(/[a-z]/)
  .map { |chr| alphabet[chr]}
  .map(&:to_s)
  .join " "
end

p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"

p alphabet_position("-.-'") == ""