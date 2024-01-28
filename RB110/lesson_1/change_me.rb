=begin
################################# PROBLEM ######################################

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

- PROBLEM:

1. What is palindromes?
  string == reverse string
2. How to deal with empty string?
  return same string
3. Uppcased strings remain the same?
  yes
4. All inputs are string?
  yes
5. Palindromes are case sensitive?
  yes
6. Return same string or new string?
  return new string

- input: string
- output: new string
- rules
  - explicit:
    - every palindromes in the string must be converted to uppercase
    - palindromes are case sensitive
  - implitcit:
    - the return string is the new string
    = if the stsring is empty, return empty string

- EXAMPLES/TEST CASES
change_me("We will meet at noon") == "We will meet at NOON"
change_me("No palindromes here") == "No palindromes here"
change_me("") == ""
change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

- DATA STRUCTURE

  - input: string
  - output: new string
  - process: array

- ALGORITHM
  - convert input string into array of words
  - initialize an empty array called `result` that will contain all required word
  - iterate through the converted array to check
    - if the word is palindrome?
      - convert the word to uppercase
      - push the word to the result array
    else -> push the word to the result array
  - join the result array
  - return the result
=end

# def change_me(string)
#   result = []

#   string.split(' ').each do |word|
#     if word == word.reverse
#       result << word.upcase
#     else
#       result << word
#     end
#   end

#   result.join(' ')
# end

# REFACTORING

def change_me(string)
  string.split(' ').each_with_object([]) do |word, temp|
    if word == word.reverse
      temp << word.upcase
    else
      temp << word
    end
  end
  .join(' ')
end

p change_me("We will meet at noon") == "We will meet at NOON"
p change_me("No palindromes here") == "No palindromes here"
p change_me("") == ""
p change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"