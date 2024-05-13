=begin
FIRST TRY 6 MINS

31. Anagram Detection

(https://www.codewars.com/kata/529eef7a9194e0cbc1000255)

7 kyu

An anagram is the result of rearranging the letters of a word to produce a new word (see wikipedia).

Note: anagrams are case insensitive

Complete the function to return true if the two arguments given are anagrams of each other; return false otherwise.

Examples

"foefet" is an anagram of "toffee"

"Buckethead" is an anagram of "DeathCubeK"

PROBLEM
-------
- case insensitive
- no empty string

EXAMPLE
-------
'Creative'
'Reactive'
->  true

DATA STRUCTURES
---------------
- input: 2 strings

- array contains all chars of first word
- array contains all chars of second word

- output: true/false

ALGORITHM
---------
- transform first word to downcase and  to array
- sort first word array
- transform second word to downcase and to array
- sort second word array
- return true/false if the 2 arrays are equal
=end

def is_anagram(str1,str2)
  word1 = str1.downcase.chars.sort
  word2 = str2.downcase.chars.sort
  word1 == word2
end

p is_anagram('Creative', 'Reactive') == true

p is_anagram("foefet", "toffee") == true

p is_anagram("Buckethead", "DeathCubeK") == true

p is_anagram("Twoo", "WooT") == true

p is_anagram("dumble", "bumble") == false

p is_anagram("ound", "round") == false

p is_anagram("apple", "pale") == false
