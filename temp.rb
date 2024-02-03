# # # Implement a function that finds all pairs of numbers whose odd indexed position in the original array is greater than 5 and whose even indexed position in the original array is less than 5. -- Uy

# # Test cases
puts find_special_pairs([2, 6, 1, 7, 4, 10]).inspect # [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
puts find_special_pairs([4, 9, 2, 6, 3, 11, 4]).inspect # [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]
puts find_special_pairs([5, 12, 3, 8]).inspect # [ [ 3, 8 ] ]
puts find_special_pairs([7, 4, 6, 5]).inspect # []
puts find_special_pairs([1, 7, 2, 8, 3, 9]).inspect # [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]

# Create a function called sumOfVowelPairs that takes a sentence and returns the total sum of the lengths of all word pairs where both words start with a vowel (a, e, i, o, u).  -- Stephen

# # Test cases
# puts sum_of_vowel_pairs("An apple a day keeps the doctor away") =begin An
# apple An a An away apple a apple away a away 36 =end puts
# sum_of_vowel_pairs("Every engineer enjoys innovative algorithms")
=begin
Every engineer
Every enjoys
Every innovative
Every algorithms
engineer enjoys
engineer innovative
engineer algorithms
enjoys innovative
enjoys algorithms
innovative algorithms
156
=end

# Find all triple of words in the sentence that have at least 2 vowels in them. -- Ross 

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
# Create a function called sumOfVowelPairs that takes a sentence and returns 
the total sum of the lengths of all word pairs where both words start with a vowel (a, e, i, o, u).  -- Stephen

Problem:
  Input: sentence string
  Output: integer representing sum of word pairs

  Rules:


Examples:
# Test cases
puts sum_of_vowel_pairs("An apple a day keeps the doctor away") 

An apple
An a
An away
apple a
apple away
a away
36

puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms")

Every engineer
Every enjoys
Every innovative
Every algorithms
engineer enjoys
engineer innovative
engineer algorithms
enjoys innovative
enjoys algorithms
innovative algorithms
156
 
Data Structure:


High level:
- Find all pairs of words
- Select words that both start with vowel
- Return count of all selected word sizes

Another approach:
- Select all words that start with vowels
- Pair each word together
- return count of all seleced words

Algorithm:
Select words that start with a,e,i,o,u
initialze array of vowel word pairs
Take selected words and find all the combinations of 2
  add each combination to this array
initialize a count variable
Loop over each word in vowel word pairs
  increment count by the size of the word

return the count

h e l l o w o r l d
0 1 2 3 4 5 6 7 8 9 

=end

# def sum_of_vowel_pairs(sentence)
#   starts_with_vowel_arr = sentence.split.select { |word| %w(a e i o u).include?(word[0].downcase) }
  
#   words.each_with_index do |word1, i|
#     words[i+1..-1].each do |word2|
#       pairs.push([word1, word2])
#     end
#   end
  
#   word_vowel_pairs = []
#   starts_with_vowel_arr.combination(2) do |word_a, word_b|
#     word_vowel_pairs << word_a << word_b
#   end

#   word_vowel_pairs.sum {|word| word.size}
# end


# puts sum_of_vowel_pairs("An apple a day keeps the doctor away")
# puts sum_of_vowel_pairs("Every engineer enjoys innovative algorithms")


# Find all triple of words in the sentence that have at least 2 vowels in them. -- Ross 

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
Input:
  -A string sentence

Ouput:
  -An array of strings that contian at least two vowels in them

Data structure:
  -Strings
  -Arrays

Algorithm:
  -Create a vowel array contian a e i o u
  -Set a triples to an empty array
  -Set a vowel counter to 0
  -Split the input string into words
  -Iterate over words array
    -Iterate over each letter in the word array
      -if the letter is inclued in vowels array
        -increment counter
    -if counter is 2 or greater append to triples array

  -Return result array


=end

# VOWELS = %w(a e i o u)


# def find_triple_with_vowels(sentence)
#   result_array = []

#   sentence.split.each do |word|
#     vowel_counter = 0
#     word.chars.each do |letter|
#       vowel_counter += 1 if VOWELS.include?(letter.downcase)
#     end
#     result_array << word if vowel_counter >= 2
#   end
#   result_array
# end


# def count_vowels(word)
#   vowels = ['a', 'e', 'i', 'o', 'u']
#   word.downcase.chars.count { |char| vowels.include?(char) }
# end

# def find_triple_with_vowels(sentence)
#   words = sentence.split(/\s+/)
#   words_with_two_vowels = words.select { |word| count_vowels(word) >= 2 }
#   result = []

#   p words_with_two_vowels.combination(3).to_a
#   (0...words_with_two_vowels.length - 2).each do |i|
#     (i + 1...words_with_two_vowels.length - 1).each do |j|
#       (j + 1...words_with_two_vowels.length).each do |k|
#         result.push([words_with_two_vowels[i], words_with_two_vowels[j], words_with_two_vowels[k]])
#       end
#     end
#   end

#   result
# end

# puts find_triple_with_vowels("This is a test sentence with some vowels").inspect # [["sentence", "some", "vowels"]]
# puts find_triple_with_vowels("The quick brown fox jumps over the lazy dog").inspect # []
# puts find_triple_with_vowels("Beautiful, bright, and sunnier days are lovely").inspect 
# # [
# #  ["Beautiful,", "bright,", "sunnier"],
# #  ["Beautiful,", "bright,", "lovely"],
# #  ["Beautiful,", "sunnier", "lovely"],
# #  ["bright,", "sunnier", "lovely"]
# # ]

=begin
Implement a function that finds all pairs of numbers whose odd indexed position
in the original array is greater than 5 and whose even indexed position
in the original array is less than 5. -- Uy
=end

# Test cases             0. 1. 2. 3. 4. 5
# puts find_special_pairs([2, 6, 1, 7, 4, 10]).inspect # [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]
# puts find_special_pairs([4, 9, 2, 6, 3, 11, 4]).inspect # [ [ 4, 9 ], [ 4, 6 ], [ 4, 11 ], [ 2, 6 ], [ 2, 11 ], [ 3, 11 ] ]

#                          0. 1.  2. 3
# puts find_special_pairs([5, 12, 3, 8]).inspect # [ [ 3, 8 ] ]
# puts find_special_pairs([7, 4, 6, 5]).inspect # []
# puts find_special_pairs([1, 7, 2, 8, 3, 9]).inspect # [ [ 1, 7 ], [ 1, 8 ], [ 1, 9 ], [ 2, 8 ], [ 2, 9 ], [ 3, 9 ] ]

# - PROBLEM
#   - Input: array of integers
#   - Output: nested array of integers

#   - Rules:
#     - Explicit:
#       - find all pairs of numbers whose odd indexed position > 5
#       - find all pairs of number whose odd indexed position < 5

#     - Implicit:
#       - only need one index in pair > 5
#       - only need one index in pair < 5

# - EXAMPLES AND TEST CASES
#   - [2, 6, 1, 7, 4, 10]
#      0  1  2  3  4  5

#   [ [ 2, 6 ], [ 2, 7 ], [ 2, 10 ], [ 1, 7 ], [ 1, 10 ], [ 4, 10 ] ]

# - DATA STRUCTURE
#   - Input: array of integer
#   - Output: 
#   - Need to have an array that can contain each pair
#   - Each pair is placed in an array

# - ALGORITHM
#   - create an empty array that contain all required pairs
#   - iterate through given array and create all subarrays that contain all pairs (create helper method)
#   - check if any number that theirs index is greater than 5 or less than 5 ( create helper method)
#   - push required pairs to the result array
#   - return the result 
# =end

def find_special_pairs(arr)
  all_pairs = []

  # First, find all pairs
  0.step(arr.length - 2, 2) do |even|
    (even + 1).step(arr.length - 1, 2) do |odd|
      all_pairs.push([arr[even], arr[odd]])
    end
  end

  # Now, filter the pairs for those that meet the conditions
  result = all_pairs.select { |pair| pair[0] < 5 && pair[1] > 5 }

  result
end

def create_sub_pairs(arr)
  result = []
  start_index = 0

  loop do
    end_index = 1

    loop do
      
      result << [arr[start_index] , arr[end_index]]

      end_index += 1
      break if end_index >= arr.size - 1
    end

    start_index += 1
    break if start_index >= arr.size - 
  end

  result
end

p create_sub_pairs([2, 6, 1, 7, 4, 10])


p words_with_two_vowels.combination(3).to_a
  (0...words_with_two_vowels.length - 2).each do |i|
    (i + 1...words_with_two_vowels.length - 1).each do |j|
      (j + 1...words_with_two_vowels.length).each do |k|
        result.push([words_with_two_vowels[i], words_with_two_vowels[j], words_with_two_vowels[k]])
      end
    end
  end