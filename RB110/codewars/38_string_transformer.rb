=begin
SECOND TRY 7 MINS

38. String transformer

(https://www.codewars.com/kata/5878520d52628a092f0002d0/train/ruby)

6 kyu

Given a string, return a new string that has transformed based on the input:

Change case of every character, ie. lower case to upper case, upper case to lower case.

Reverse the order of words from the input.

Note: You will have to handle multiple spaces, and leading/trailing spaces.

For example:

"Example Input" ==> "iNPUT eXAMPLE"

You may assume the input only contain English alphabet and spaces.

PROBLEM
-------
- given  a string
- return transform string
  - swap case of every chars
  - reverse the other of words from input
  - only contains alphabetical chars and spaces

EXAMPLES
--------
"Example Input" ==> "iNPUT eXAMPLE"

DATA STRUCTURES
---------------
- input: string
- output: string that is tranformed as requried

ALGORITHM
---------
- transform given string into array of words
- transform each word in array of words ot its swapcase
- transform and return  array of words
=end

def string_transformer(str)
  words = str.split.reverse.map(&:swapcase).join(" ")
end

p string_transformer("Example Input") == "iNPUT eXAMPLE"
