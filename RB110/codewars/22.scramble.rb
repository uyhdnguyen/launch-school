=begin
FIRST TRY 8 MINS

22. Scramblies

(https://www.codewars.com/kata/55c04b4cc56a697bb0000048/train/ruby)

5 kyu

Complete the function scramble(str1, str2) that returns true if a portion of str1 characters can be rearranged to match

str2, otherwise returns false.

Notes:

Only lower case letters will be used (a-z). No punctuation or digits will be included.

Performance needs to be considered

Input strings s1 and s2 are null terminated.

PROBLEM
-------
- input: 2 string called str1, str2
- output: true/false if some chars in str1 can be rearranged to match str2
- `scramble`
- case insensitive
- no numbers, punctuation

EXAMPLES
--------
'rkqodlw', 'world'
-> TRUE

'katas', 'steak'
-> FALSE

DATA STRUCTURES
---------------
- array contains all chars in str2

ALGORITHM
---------
- TRANSFORM  str2 into an array of characters
- RETURN true if all chars in str2 are in str1
  - `all?`
=end

def scramble(str1, str2)
  str2.chars.all? {|chr| str1.include?(chr)}
end

p scramble('rkqodlw', 'world') == true

p scramble('cedewaraaossoqqyt', 'codewars') == true

p scramble('katas', 'steak') == false

p scramble('rkqodlw','world') == true

p scramble('cedewaraaossoqqyt','codewars') == true

p scramble('katas','steak') == false

p scramble('scriptjava','javascript') == true

p scramble('scriptingjava','javascript') == true