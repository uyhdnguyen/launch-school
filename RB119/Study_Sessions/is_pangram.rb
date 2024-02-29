=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore numbers and punctuation.

PROBLEM
-------
- input: string
- output: true/false if it's pangram

- pangram  = sentence contains every single letter of the alphabet at least 1
- case insensitive
- ignore numbers and punctuation

EXAMPLES
--------
"The quick brown fox jumps over the lazy dog"
-> true

DATA STRUCTURES
---------------
- array for the alphabet in lowercase

ALGORITHM
---------
- create alphabet
  - `alphabet`

- iterate through all of the characters in `alphabet`
  - if all characters are in alphabet -> return true
  - else, return false
=end

def is_pangram?(str)
  alphabet = ('a'..'z').to_a

  strings = str.downcase.chars

  alphabet.each do |chr|
    return false unless strings.include?(chr)
  end
  
  true
end

p is_pangram? "The quick brown fox jumps over the lazy dog" 