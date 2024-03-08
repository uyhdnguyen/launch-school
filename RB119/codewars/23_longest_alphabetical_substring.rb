=begin
FIRST TRY 31 MINS

23. Longest alphabetical substring

(https://www.codewars.com/kata/5a7f58c00025e917f30000f1)

6 kyu

Find the longest substring in alphabetical order.

Example: the longest alphabetical substring in "asdfaaaabbbbcttavvfffffdf" is "aaaabbbbctt".

There are tests with strings up to 10 000 characters long so your code will need to be efficient.

The input will only consist of lowercase characters and will be at least one letter long.

If there are multiple solutions, return the one that appears first.

PROBLEM
-------
- input: string in lowercase
- output: substring in lowercase for alphabetical order

- find longest substring in alphabetical order
- no empty string input
- no digits input

EXAMPLES
--------
"asdfaaaabbbbcttavvfffffdf"
"aaaabbbbctt"

'nab'
'ab'

'asdfbyfgiklag'
'fgikl'

------------------
'hello'
h he hel hell hello
e el ell ello
l ll llo
l lo
o
DATA STRUCTURES
---------------
- array contains all of the substring
- array for the alphabet
- helper method to return true/false if given substring is in alphabetical order

ALGORITHM
---------
- HELPER METHOD `is_alphabetical_order`
  - input: substring
  - output: true/false

  - create the alphabet
    -  alphabet/ ('a'..'z').to_a
  - create current index counter
    - current_idx = -1
  - find the indices of all chars in given string in the alphabet
    - iterate through each char in given string
      - return false if the index of current char is less than current_idx
      - else, reassign current_idx to index of current char
  - always return true
-----------------------------------------------------------------

- create counter for longest substring in alphabetical order
  - `longest_substring_size` = 0
- create counter for longest substring in alphabetical order
  - `longest_substring` = ""
- create substrings
  - iterate from idx(0 to last)
    - create a range from (1 to size - idx)
      - [idx, range]
- find which substring is_alphabetical_order
  - return the size of that substring to longest_substring_size
  - return the substring to longest_substring
return the substring

=end

def is_alphabetical_order(str)
  alphabet = ('a'..'z').to_a

  current_idx = -1

  str.each_char do |chr|
    if alphabet.index(chr) >= current_idx
      current_idx = alphabet.index(chr)
    else
      return false
    end
  end

  true
end

def longest(str)
  longest_substring_size = 0
  longest_substring = ""

  (0...str.size).each do |idx|
    (1..str.size - idx).each do |range|
      substring = str[idx, range]

      if is_alphabetical_order(substring) && substring.size > longest_substring_size
        longest_substring_size = substring.size
        longest_substring = substring
      end
    end
  end

  longest_substring
end

p longest('asd') == 'as'

p longest('nab') == 'ab'

p longest('abcdeapbcdef') == 'abcde'

p longest('asdfaaaabbbbcttavvfffffdf') == 'aaaabbbbctt'

p longest('asdfbyfgiklag') =='fgikl'

p longest('z') == 'z'

p longest('zyba') == 'z'
