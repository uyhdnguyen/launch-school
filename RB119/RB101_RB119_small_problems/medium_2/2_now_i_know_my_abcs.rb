=begin
A collection of spelling blocks has two letters per block, as shown in this list:

B:O   X:K   D:Q   C:P   N:A
G:T   R:E   F:S   J:W   H:U
V:I   L:Y   Z:M

This limits the words you can spell with the blocks to just those words that do not use both letters from any given block. Each letter in each block can only be used once.

Write a method that returns true if the word passed in as an argument can be spelled from this set of blocks, false otherwise.

Examples:

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

- PROBLEM
  - Input: string that represent a word 
  - Output: true/false 
    
  - Rules:
    - Explicit:
      - given string represent a word
      - word can be spelled from given blocks
    - Implicit:
      - word can be upper-case or lower-case
      - two letters per block in array/ hash
      - word must has unique characters
- EXAMPLES AND TEST CASES
  block_word?('BATCH') == true
  block_word?('BUTCH') == false
  block_word?('jest') == true

- DATA STRUCTURE
  - Input: string
  - Output: boolean value
  - Array since there are 2 characters for each block

- ALGORITHM
  - convert given string into `arr_chars`
  - iterate through blocks
    - if each block has char, return true
    -else return false
  - check if return arr has all true value
    - return true
    - else false
=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def block_word?(word)
  BLOCKS.map {|block| word.upcase.count(block) < 2}.all? 
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true