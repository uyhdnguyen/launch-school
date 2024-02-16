=begin
Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four'
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:
- PROBLEM
  - Input: 
  - Output: 

  - Rules:
    - Explicit:
    - Implicit:

- EXAMPLES AND TEST CASES
word_to_digit('Please call me at five five five one two three four. Thanks.') 
== 'Please call me at 5 5 5 1 2 3 4. Thanks.'

- DATA STRUCTURE
  - Input: 
  - Output: 
  - Array? Hash? Combination?

- ALGORITHM
  - 

=end

DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(string)
  strings = string.split(" ")

  strings.map do |word| 
  if DIGIT_HASH.keys.include?(word)
    word = DIGIT_HASH[word] 
  else
    word
  end
end
  .join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'