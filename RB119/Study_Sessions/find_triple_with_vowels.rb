# Find all triple of words in the sentence that have at least 2 vowels in them.

# # Test cases
# puts find_triple_with_vowels("This is a test sentence with some vowels").inspect # [["sentence", "some", "vowels"]]

# puts find_triple_with_vowels("The quick brown fox jumps over the lazy dog").inspect # []

# puts find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely").inspect 
# [
#  ["Beautiful,", "bright,", "sunnier"],
#  ["Beautiful,", "bright,", "lovely"],
#  ["Beautiful,", "sunnier", "lovely"],
#  ["bright,", "sunnier", "lovely"]
# ]

=begin

- PROBLEM
  - Input: strings that contains the whole sentence
  - Output: array that contains combination of 3 words inside another array

  - Rules:
    - find 3 words in given array
    - each word must have at least 2 vowels
    - order does not matter
    - if no word found -> return empty array

- EXAMPLE
  - "Beautiful, bright, and sunnier days are lovely"
  [
  ["Beautiful,", "bright,", "sunnier"],
  ["Beautiful,", "bright,", "lovely"],
  ["Beautiful,", "sunnier", "lovely"],
  ["bright,", "sunnier", "lovely"]
  ]

- DATA STRUCTURE
  - Array to contains the combination of 3 words inside another array

- ALGORITHM
  - create an array to contain all of the combinations
    - initialize an array of combinations
      - `result`
  - transform given string into an array that contain all of the words
    - use `split` method to convert string into words
      - `strings`
  - select all of the words that have 2 vowels or more
    - check if word contains vowels
      - use `each` method to iterate through each character of word to check if word is a vowel word
      - use `count` method to check if the count of vowels >= 2
  - find combination of 3 words among all of the words
    - use `combination` method with 3 passed in as an argument
  - return the array that contain all of the combinations
=end

def is_vowel_word?(word)
  word.downcase.each_char do |char|
    return true if %w(a e i o u).include?(char)
  end
  false
end

def words_with_two_vowels(word)
  # count = 0

  # word.each_char do |char|
  #   count += 1 if %w(a e i o u).include?(char)
  # end
  # count

  vowels = ['a', 'e', 'i', 'o', 'u']
  word.each_char.count {|char| %w(a e i o u).include?(char)}
end

def find_triple_with_vowels(string)
  result = []

  strings = string.split(" ")

  strings.each { |word| result << word if is_vowel_word?(word) && words_with_two_vowels(word) >= 2 }

  result.combination(3).to_a

  #   (0...words_with_two_vowels.length - 2).each do |i|
#     (i + 1...words_with_two_vowels.length - 1).each do |j|
#       (j + 1...words_with_two_vowels.length).each do |k|
#         result.push([words_with_two_vowels[i], words_with_two_vowels[j], words_with_two_vowels[k]])
#       end
#     end
#   end

end

p find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely")


