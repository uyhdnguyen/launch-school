=begin
In this kata, you've to count lowercase letters in a given string and return the letter count in a hash with 'letter' as key and count as 'value'. The key must be 'symbol' instead of string in Ruby and 'char' instead of string in Crystal.

PROBLEM
-------
- input: string that contains letters
- output: hash contains 
          - letters in symbol format as key
          - counts as value
- case insensitive
- no empty given string
- there are duplicates in letters
EXAMPLE
-------
'arithmetics'
=> {:a=>1, :c=>1, :e=>1, :h=>1, :i=>2, :m=>1, :r=>1, :s=>1, :t=>2}


DATA STRUCTURES
---------------
- hash as required outputs

ALGORITHM
---------
- create hash as required outputs
  - `result`
- find the counts for all of the characters
  - iterate through all of the characters in given string
  - transform the character into symbol
    - to_sym
  - find and return the count for each characters to `result`
    - count
- return the `result`
=end

def letter_count(str)
  result = Hash.new(0)

  str.each_char do |chr|
    result[chr.to_sym] += 1
  end

  result.sort.to_h
end

p letter_count('codewars')
p letter_count('activity')
p letter_count('arithmetics')

# {:a=>1, :c=>1, :d=>1, :e=>1, :o=>1, :r=>1, :s=>1, :w=>1}