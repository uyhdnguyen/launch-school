=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

PROBLEM
-------
- input: string contains consonants and vowels
- output: integer that represent the length of longest vowel substring

- case insensitive
- empty substring is ignored

EXAMPLES
--------
codewarriors
-> o e a io
-> 2

iiihoovaeaaaoougjyaw
-> iii oo aeaaaoou a
-> 8

DATA STRUCTURES
---------------
- array contains all of the vowel substrings

ALGORITHM
---------
- create vowels array of all of vowels
  - `vowels`
- create array contains all of the vowel substrings
  - `vowel_substrings`
- find all of the vowel substrings from given array
  - create temp string
    -`temp_string`
  - iterate through all of the chars in given array index(0 -> last)
    - if char is a vowel -> add it to `temp_string`
    - else, return temp_string to `vowel_substrings`
  - return the longest size for each substring in `vowel_substrings`
    - map(&:size).max

##### codewarriors
       
=end

# def longest_vowel_chain(str)
#   vowels = %w(a e i o u)

#   vowel_substrings = []

#   temp_string = ""

#   str.each_char do |chr|
#     if vowels.include?(chr)
#       temp_string << chr
#     else
#       vowel_substrings << temp_string
#       temp_string = ""
#     end
#   end

#   vowel_substrings.map(&:size).max
# end


# def longest_vowel_chain(str)
#   vowels = %w(a e i o u)

#   longest_count = 0
#   current_count = 0
#   temp_string = ""

#   str.each_char do |chr|
#     if vowels.include?(chr)
#       current_count += 1
#     else
#       longest_count = current_count if longest_count < current_count
#       current_count = 0  
#     end
#   end

#   longest_count
# end

def longest_vowel_chain(str)
  strings = str.split(/[^aeiou]/).reject{|sub| sub == "" }

  strings.map(&:size).max
end

p longest_vowel_chain("codewarriors")
p longest_vowel_chain("iiihoovaeaaaoougjyaw")