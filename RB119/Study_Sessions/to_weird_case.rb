# 53. WeIrD StRiNg CaSe
# (https://www.codewars.com/kata/52b757663a95b11b3d00062d)
# 6 kyu
# Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even
# indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing
# just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased.
# The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are
# multiple words. Words will be separated by a single space(' ').
# PEDAC:
# P:
# - write a method that a str as an arg
# - str can have spaces if there multiple words
# - one alphabetical characters

# - method has to return THE SAME string
# - characters and even indices get upcased
# - characters at odd indices get lowercased

=begin

- PROBLEM
  - Input: string that contains words separated by spaces in between
  - Output: same mutated string

  - Rules:
    - each word in a string has
      - even indexed characters == uppercased
      - odd indexed characters == lowercased
    - zero-ith index is even

- EXAMPLE
  -"Weird string case" => "WeIrD StRiNg CaSe"

- DATA STRUCTURE
  - just string because we need to return the mutated string

- ALGORITHM
  - transform given string into words
    - use `map` method with `" "` passed in as argument
  - transform each character of each words based on its index value
    - use `map` and `with_index` method to return transformed elements and indices
  - transform each word back to string
    - use `join` method to join characters then join words

=end

def toWeirdCase(string)
  string.split(" ").map do |word|
    word.chars.map.with_index do |char, index|
      char = index.even? ? char.upcase : char.downcase
    end.join
  end.join(" ")
end

str = "Weird string case"


p str.object_id

p toWeirdCase(str) == "WeIrD StRiNg CaSe"

p str.object_id

