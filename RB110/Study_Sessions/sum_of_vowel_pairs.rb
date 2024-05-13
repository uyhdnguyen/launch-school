# Create a function called sumOfVowelPairs that takes a sentence and returns the total sum of the lengths of all word pairs where both words start with a vowel (a, e, i, o, u).

# # Test cases
# puts sum_of_vowel_pairs("An apple a day keeps the doctor away") == 36 
# puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156

=begin

PROBLEM
-------
  - Input: string sentence contains words
  - Output: an integer of total sum of the lengths of all word PAIRS

  - Rules:
    - create function `sum_of_vowel_pairs`
    - pairs where both words start with a vowel
    - find all of these pairs
    - return the sum
    - case insensitive
    - do not check if given string is empty

EXAMPLE
-------
  - "An apple a day keeps the doctor away"
    - an apple a away
      - an apple - 7
      - an a - 3
      - an away - 6
      - apple a - 6
      - apple away - 9
      - a away - 5
      sum is 36

DATA STRUCTURE
--------------
  - array because we need to find all pairs that has each words start with a vowel

ALGORITHM
---------
  - create an empty array to contain all of the required pairs
  - transform the sentence into an array of words
  - select all of the words that start with vowel
  - find all of the pairs from those selected words
      - combination method
  - find the sum of all of the words' lengths in pairs
  - return the sum
=end

def sum_of_vowel_pairs(sentence)
  vowel_pairs = []
  vowel_words = sentence.split.select { |word| %w(a e i o u).include?(word[0].downcase)}

  (0..vowel_words.length - 2).each do |left_index|
    (left_index + 1..vowel_words.length - 1).each do |right_index|
      vowel_pairs << [vowel_words[left_index ], vowel_words[right_index]]
    end
  end
  vowel_pairs.flatten.join.length
  # vowel_words.combination(2).to_a.flatten.join.length
end

p sum_of_vowel_pairs("An apple a day keeps the doctor away") #== 36
p sum_of_vowel_pairs("Every engineer enjoys innovative algorithms") == 156