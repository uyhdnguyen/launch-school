=begin
20. Count and Group Character Occurrences in a String

(https://www.codewars.com/kata/543e8390386034b63b001f31)

6 kyu

Write a method that takes a string as an argument and groups the number of times each character appears in the string

as a hash sorted by the highest number of occurrences.

The characters should be sorted alphabetically e.g:

get_char_count("cba") => {1=>["a", "b", "c"]}

You should ignore spaces, special characters and count uppercase letters as lowercase ones.

PROBLEM
-------
- input: string 
- output: hash
        - key as count of characters
        - value are an array of characters
- output is sort descending
- the chracter is sorted alphabetically
- case insensitive
- ignore spaces & special chars
- numbers are counted as well

EXAMPLES
--------
"Mississippi"
{4=>["i", "s"], 2=>["p"], 1=>["m"]}

"Hello. Hello? HELLO!!"
{6=>["l"], 3=>["e", "h", "o"]}

"abc123"
 {1=>["1", "2", "3", "a", "b", "c"]}

DATA STRUCTURES
---------------
- hash for the output
- array for the unique chars

ALGORITHM
---------
- transform given string into cleaned up chars
  - chars/ downcase, scan(/[^a-zA-Z0-9]/
- create unique chars array
  - unique_chars/ uni
- find and return the counts for each uniq_char
  - iterate through all chars in uniq_char
    - find and return the unique counts
-> counts/
- create hash for the output
  - result/ {}
- create hash for the output with all of count as keys with  empty arrays as value
  - iterate through all counts in counts with empty arrays as value
- return the letters to hash
  - if count of letter is the key in hash, add the letters to value

- return the hash

=end

def get_char_count(str)
  chars = str.downcase.scan(/[a-zA-Z0-9]/)

  unique_chars = chars.uniq.sort

  counts = unique_chars.map{|chr| chars.count(chr)}.uniq.sort_by{|count| -count}

  result = {}

  counts.each {|count| result[count] = []}

  unique_chars.each do |chr|
    result[chars.count(chr)] << chr if result.key?(chars.count(chr))
  end

  result
end

p get_char_count("Mississippi") == {4=>["i", "s"], 2=>["p"], 1=>["m"]}

p get_char_count("Hello. Hello? HELLO!!") == {6=>["l"], 3=>["e", "h", "o"]}

p get_char_count("aaa...bb...c!") == {3=>["a"], 2=>["b"], 1=>["c"]}

p get_char_count("aaabbbccc") == {3=>["a", "b", "c"]}

p get_char_count("abc123") == {1=>["1", "2", "3", "a", "b", "c"]}