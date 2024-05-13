=begin
Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.
Performance needs to be considered.

PROBLEM
-------
- input: 2 trings
- output: true/false 

- method called `scamble`
- return true
  - part of str1 can be rearranged to match str2
- else, return false
- lowercase letters input
- no punctuation or digits

EXAMPLES
--------
scramble('rkqodlw', 'world') ==> True

scramble('cedewaraaossoqqyt', 'codewars') ==> True

scramble('katas', 'steak') ==> False

DATA STRUCTURES
---------------
- convert str2 to an array

ALGORITHM
---------
- iterate through each characters of str2
  - if all of the characters of str2 are included in str1 -> true
  - else -> false
=end

def scramble(str1,str2)
  str2.chars.all?{ |chr| str1.include?(chr)}
end

p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false