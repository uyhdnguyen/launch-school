=begin

16. Stop gninnipS My sdroW!

(https://www.codewars.com/kata/5264d2b162488dc400000001)

6 kyu

Write a function that takes in a string of one or more words, and returns the same string, but with all five or more letter

words reversed (Just like the name of this Kata). Strings passed in will consist of only letters and spaces. Spaces will be

included only when more than one word is present.

Examples: spin_words( "Hey fellow warriors" ) => returns "Hey wollef sroirraw"

PROBLEM
-------
- input: string of >= 1 words
- output: same string with all five or more letter

- only alphabetical letters and space
- Spaces will be included only when more than one word is present.
- reverse all strings that has the length of 5 or more letters

EXAMPLES:
---------
"Hey fellow warriors"
-> "Hey wollef sroirraw"

"This is a test"
-> "This is a test"

"This is another test"
-> "This is rehtona test"

DATA STRUCTURES
---------------
- array to hold all of the words

ALGORITHM
---------
- transform given sstring into an array of words
  - `split` pass it `space` as argument
- tranform each word in the array to its reverse format if thge length of the word is greater than 5
  - `map` `reverse` `size`
- return the new string
  - `join` pass it `space` as an argument

=end

def spin_words(str)
  str
  .split
  .map do |word| 
    if word.size >= 5
      word.reverse
    else
      word
    end
  end
  .join " "
end

def spinWords(str)
  str.split.map { |s| s.length >= 5 ? s.reverse : s }.join " "
end

p spin_words("Hey fellow warriors") == "Hey wollef sroirraw"

p spin_words("This is a test") == "This is a test"

p spin_words("This is another test") == "This is rehtona test"

p spin_words("test") == "test"