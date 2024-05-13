=begin
28. Where my anagrams at?

(https://www.codewars.com/kata/523a86aa4230ebb5420001e1)

5 kyu

What is an anagram? Well, two words are anagrams of each other if they both contain the same letters. For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false

Write a function that will find all the anagrams of a word from a list. You will be given two inputs a word and an array

with words. You should return an array of all the anagrams or an empty array if there are none. For example:

PROBLEM
-------
- input: 
  - a string that is a word
  - an array contains multiple words
- output: an array contains all of the anagrams

- ANAGRAM : two words contains the same letters
- find all anagrams of a word
- no empty inputs

EXAMPLES
--------
'abba', ['aabb', 'abcd', 'bbaa', 'dada']
-> ['aabb', 'bbaa']

'racer', ['crazer', 'carer', 'racar', 'caers', 'racer']
-> ['carer', 'racer']

DATA STRUCTURES
---------------
- ARRAY contains all of the anagrams

ALGORITHM
---------
- sort all chars in given word
- select all of the anagrams in given array
  - iterate through each word in given array
    - sort each word and check if they are the same as given sorted word
- return anagrams

=end

def anagrams(wrd, arr)
  word = wrd.chars.sort.join

  arr.select { |w| word == w.chars.sort.join }
end

p anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) == ['aabb', 'bbaa']

p anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) == ['carer', 'racer']

p anagrams('laser', ['lazing', 'lazy', 'lacer']) == []