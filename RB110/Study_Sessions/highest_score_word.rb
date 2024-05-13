
=begin
PROBLEM
=======
- input: string of words
- output: highest scoring word

- the score is based on letter's position in the alphabet
- return the highest scoring words as a string
- if words has the sam score, return the word that appears ealiest in the original string
- case insensitve

EXAMPLES
========
'man i need a taxi up to ubud' == 'taxi'

DATA STRUCTURES
===============
need a place holder to hold current longest score

ALGORITHM
=========

- create a placeholder to keep the index of `highest_score`
- create a counter to keep the score of higest score word
  - initialize `highest_score`
- transform given string into an array of words
  - `words`
    - use `split` method
- iterate through each words and call helper method to count the score of current word
  - if count of current word is  greater than the count of `highest_score`
    - reassign `highest_score` to the current count
  - return the word based on its index ( this to make sure return the longest word)
********************
  - create a helper method to count the score of current words
  - transform given words into array of characters
    - `characters`
  - create an alphabet and transform it to an array for reference
    - `alphabet` & ('a'..'z').to_a
  - create count variable to hold the count of character
    - `total` = 0 
  - iterate through each characterin the alphabet and ad ist index to the `total`
    - each, with_index method
  - return the total

=end

def word_score(string)
  # alphabet = ('a'..'z').to_a
  alphabet = ('a'..'z').zip(1..26).to_h

  characters = string.chars

  # alphabet.each.with_index{|char, index| total += index + 1 if characters.include?(char)}

  characters.reduce(0) {|total, char|  total += alphabet[char] if alphabet.has_key?(char)}
end


def highest_score_word(string)
  highest_score_index = 0
  highest_score = 0

  words = string.split

  words.each.with_index do |word, index|
    if word_score(word) > highest_score
      highest_score = word_score(word)
      highest_score_index = index
    end
  end
  
  words[highest_score_index]
end

def highest_score_word(string)
  highest_score = {}

  words = string.split

  words.each do |word|
    highest_score[word] = word_score(word)
  end
  
  highest_score.max_by{|word,score| score}.first
end

def highest_score_word(string)
  highest_score = {}

  words = string.split

  words.each do |word|
    highest_score[word_score(word)] = word unless highest_score.has_key?(word_score(word)) 
  end
  
  highest_score.sort.last.last
end

p highest_score_word ('man i need a taxi up to ubud jjjjn')

# def hightest_scoring_word(str)
#   result = {}
#   alphabet = ('a'..'z').to_a.zip(1..26).to_h

#   array = str.split

#   array.each do |word|
#     result[word] = word.chars.map { |ch| alphabet[ch] }.sum
#   end

#   max = result.values.max
#   result.each do |word, value|
#     return word if value == max
#   end
# end