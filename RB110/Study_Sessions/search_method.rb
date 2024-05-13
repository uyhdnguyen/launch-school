=begin
Complete the solution so that it returns the number of times the search_text is found within the full_text. Overlap is not permitted : "aaa" contains 1 instance of "aa", not 2.

Usage example:
full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
    ---> should return 2 since "bb" shows up twice


full_text = "aaabbbcccc", search_text = "bbb"
    ---> should return 1

PROBLEM
-------
- input: 2 strings
        - one is full_text
        - one is search_text

- output: integer that represents how many times the search_text is found

rules:
- method that find search_text  from full_text
- Overlap is not allowed.
  "aaa" contains 1 instance of "aa", not 2.
- empty search_text && space?

EXAMPLES
--------
full_text = "aa_bb_cc_dd_bb_e", search_text = "bb"
-> 2
aa a_ _b bb b_ _c cc c_ _d dd d_ _b bb b_ _e

full_text = "aaabbbcccc", search_text = "bbb"
-> 1
aaa aab abb bbb bbc bcc ccc ccc


full_text = "aaa", search_text = "aa"
-> 1

DATA STRUCTURES
---------------
- array contains all of the substrings


ALGORITHM
---------
- create array contains all of the substrings
  - `substrings`
- find all of the substrings with size of given search_text
  - create range for the size of the search_text
    - `search_text_range` == search_text.size
  - iterate through all of the characters of given string (first index -> last index - `search_text_range`)
  - find and return all of the substring with given `search_text_range`
    - slice method([])
    - push substrings to `substrings`
- return the size of substrings
=end

# OPTION 1
def search_method(full_text, search_text)
  substrings = []

  search_text_range = search_text.size

  (0..full_text.size - search_text_range).each do |idx|
    substrings << full_text[idx,search_text_range]
  end

  substrings.select { |sub| sub == search_text}.size
end

# OPTION 2
def search_method(full_text, search_text)
  search_text_counter = 0

  search_text_range = search_text.size

  (0..full_text.size - search_text_range).each do |idx|
    search_text_counter += 1 if full_text[idx,search_text_range] == search_text
  end

  search_text_counter
end
p search_method "aa_bb_cc_dd_bb_e", "bb"
p search_method "aaabbbcccc", "bbb"