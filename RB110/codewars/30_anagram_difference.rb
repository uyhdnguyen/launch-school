=begin
30. Anagram difference

(https://www.codewars.com/kata/5b1b27c8f60e99a467000041)

6 kyu

Given two words, how many letters do you have to remove from them to make them anagrams?

Example

First word : c od e w ar s (4 letters removed)

Second word : ha c k er r a nk (6 letters removed)

Result : 10

Hints

A word is an anagram of another word if they have the same letters (usually in a different order).

Do not worry about case. All inputs will be lowercase.

PROBLEM
-------
- given 2 words
- how many letters have to be removed to make anagrams
-  o d  w   s
- h a  k  r   n k

- if one input string is empty -> remove all of chars in other inputs
- 

EXAMPLES
--------
'', ''
-> 0

'a', ''
-> 1

'ab', 'a'
-> 1

'codewars', 'hackerrank'
-> 10

DATA STRUCTURES
---------------
- 

=end

def anagram_difference(str1, str2)
  all_chars = Hash.new(0)

  str1.chars.each do |chr|
    all_chars[chr] += 1
  end
  all_chars

  str2.chars.each do |chr|
    all_chars[chr] -= 1
  end

  all_chars.values.map(&:abs).sum
end

p anagram_difference('', '') == 0

p anagram_difference('a', '') == 1

p anagram_difference('', 'a') == 1

p anagram_difference('ab', 'a') == 1

p anagram_difference('ab', 'ba') == 0

p anagram_difference('ab', 'cd') == 4

p anagram_difference('aab', 'a') == 2

p anagram_difference('a', 'aab') == 2

p anagram_difference('codewars', 'hackerrank') #== 10
