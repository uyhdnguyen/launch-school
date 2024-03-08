=begin
32. Highest Scoring Word

(https://www.codewars.com/kata/57eb8fcdf670e99d9b000272)

6 kyu

Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

PROBLEM
-------
- string of words
- find the highest scoring word
- letter score is its position in the alphabet
- return the highest scoring words as a string
- return the first found if there are multiple words have the same score
- input are all letters and lower case

EXAMPLES
--------
'man i need a taxi up to ubud'
-> 'taxi'

'take me to semynak'
-> 'semynak'

DATA STRUCTURES
---------------
- input: string of words

- array contains the alphabet with score
- helper method to count score for each word
- counter to keep track of highest score
- counter to keep track of highest score word

- output: string that is first highest score found

ALGORITHM
---------
- create helper method to count score for each word
  - word_score
  - input: word
  - output: int that is score of the word

  - create array contains the alphabet with score
    - alphabet | ("a".."z").zip(1..26).to_h
  - transform the word into array of chars
  - transfer all letter to its score
  - return the sum of the array
----------------------------------------------------
- transform given str into array of words
  - words | split
- create counter to keep track of highest score
  - highest_score | 0
- create counter to keep track of highest score word
  - highest_score_word = ""
- find and return the higest_score_word
  - iterating through all word in array of words
    - if score of the word is greater than highest_score
      - reassign highest_score to that score
      - reassign highest_score_word  to that word
  - return the highest_score_word
=end

def word_score(str)
  alphabet = ("a".."z").zip(1..26).to_h

  str.chars.map { |chr| alphabet[chr]}.sum
end

def highest_score_word(str)
  words = str.split
  highest_score = 0
  highest_score_word = ""

  words.each do |word|
    if word_score(word) > highest_score
      highest_score = word_score(word)
      highest_score_word = word
    end
  end

  highest_score_word
end

p highest_score_word('man i need a taxi up to ubud') == 'taxi'

p highest_score_word('what time are we climbing up the volcano') == 'volcano'

p highest_score_word('take me to semynak') == 'semynak'

p highest_score_word('aaa b') == 'aaa'