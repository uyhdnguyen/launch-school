=begin
Write a function that accepts a string, and returns the same string with all even indexed characters in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith index is even, therefore that character should be upper cased and you need to start over for each word.

The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. Words will be separated by a single space(' ').

PROBLEM
-------
- input: string
- output: same mutated string

- return string
  - all even indexed chacracters -> uppercased
  - index 0 is even
  - start over for each word
  - input string spaces & only alphabetical characters
  - only single space to separate word
  - empty string?

EXAMPLES
--------
"Weird string case" 
=> "WeIrD StRiNg CaSe"

DATA STRUCTURES
---------------
- perform transformation on given string

ALGORITHM
---------
# OPTION 1
- create a counter and assign the counter to 0
  - `word_counter` = 0

- transform given string base on indices
  - iterate through the string
  - if char is not space
    - transform char based on `word_counter`
      - even index -> upcase
      - else -> downcase
    - increase `word_counter` by 1
  - else, reset word_counter to 0

- return the original string
----------------------------------------------
# OPTION 2
- transform given string into words
    - use `map` method with `" "` passed in as argument
  - transform each character of each words based on its index value
    - use `map` and `with_index` method to return transformed elements and indices
  - transform each word back to string
    - use `join` method to join characters then join words
=end

def toWeirdCase(str)
  word_counter = 0

  str.each_char.with_index do |chr, idx|
    if chr == " "
      word_counter = 0
    else
      if word_counter.even?
        str[idx] = chr.upcase 
      else
        str[idx] = chr.downcase
      end
      word_counter += 1
    end
  end
end

# def toWeirdCase(string)
#   string.split(" ").map do |word|
#     word.chars.map.with_index do |char, index|
#       char = index.even? ? char.upcase : char.downcase
#     end.join
#   end.join(" ")
# end

str = "Weird string case"

p str.object_id

p toWeirdCase(str) #== "WeIrD StRiNg CaSe"

p str.object_id