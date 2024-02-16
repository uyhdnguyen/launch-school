=begin
A pangram is a sentence that contains every single letter of the alphabet at
least once. For example, the sentence "The quick brown fox jumps over the lazy
dog" is a pangram, because it uses the letters A-Z at least once
(case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is,
False if not. Ignore numbers and punctuation.
=end

# Given a string
# Convert the string to lower case
# Convert the string to an array using split and assign new array as the result
# Delete all spaces elements and duplicated elements
# Iterate through each element to check if it's in character's range
  # If yes, continue to the next element
  # If no, return false

ALPHABET = ('a'..'z')

# def panagram?(string)
#   converted_string = (string.downcase.split('')).uniq.delete_if{ |char| char == ' ' || char == '.' }
#   converted_string.length == 26 ? true : false
# end

# def panagram?(string)
#    str.downcase.gsub(/[^a-z]/, "").split("").uniq.size == 26
# end


def panagram?(string)
  ALPHABET.all? { |char| string.downcase.include?(char) }
end


p panagram?("The quick brown fox jumps over the lazy dog.")
p panagram?("This is not a pangram.")
