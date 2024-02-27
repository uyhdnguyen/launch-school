=begin
PROBLEM
-------
- input: string
- ouput: string that represents characters

- return the characters that appear the least in given string
- return the one appears first in the string if there multiple characters that has the same count
- case insensitive
- dont need to check for empty string
- whitespace is counted as character
- only need to return lowercase character

EXAMPLES
--------
"Hello World" -> "h"
"Happy birthday!" -> " "

- there are 2 options to get the least occurrence character
  - use counter and if the count for next character is smaller, reassign the counter to smaller value
  - find the count for all of the characters and return the smallest count
DATA STRUCTURES
---------------
- hash to hold the counts for each characters
  - index is key
  - count is value
- array to hold all of the unique characters

ALGORITHM
---------
OPTION 1
- create a hash to hold the counts for each character
  - `counted_chars`
- create an arrray to hold all of the downcase unique characters
  - `unique_chars`, uniq method, downcase
- transform the given string into array of lowercase characters
  - `all_chars`, downcase, map
- find all of the counts for each unique character
  - iterate through all elements of `all_chars`
    - each method
  - find and return the counts of each char to `counted_chars`
  - return  the min counts from `counted_chars`
-----------------------------------------------------
OPTION 2
- create a counter for least occurence char
  - least_occurrence_count to the first char's count
- create an index for least occurence char
  - least_occurrence_idx
- transform string into downcase
  - downcase
- find the least occcurent character from given string
  - iterate through each char in the given string
    - each_char
  - find the count of the chars
    - if count of the current char is smaller than `least_occurrence_count` 
    -> reassign the count to the count of current char
    -> reassign the idx to the least_occurrence_idx
  - return the least occurrent char
=end

# OPTION 1
def least_common_char(str)
  counted_chars = Hash.new

  all_chars = str.chars.map(&:downcase)

  all_chars.each_with_index do |chr, idx|
    counted_chars[chr] = [idx, all_chars.count(chr)] unless counted_chars.has_key?(chr)
  end
  
  counted_chars.sort_by {|_,(idx,count)| [count,idx]}.first.first
end


# OPTION 2
# def least_common_char(str)
#   str = str.downcase
#   least_occurrence_count = str.count(str[0])
#   least_occurrence_idx = nil

#   str.downcase.each_char.with_index do |chr, idx|
#     if str.count(chr) < least_occurrence_count
#       least_occurrence_count = str.count(chr)
#       least_occurrence_idx = idx
#     end
#   end

#   str[least_occurrence_idx]
# end

p least_common_char("Hello World") #== "h"
p least_common_char("Peter Piper picked a peck of pickled peppers") #== "t"
p least_common_char("Mississippi") #== "m"
p least_common_char("Happy birthday!") #== ' '
p least_common_char("aaaaaAAAA") #== 'a'