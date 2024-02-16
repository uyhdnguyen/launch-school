=begin
# Write a function that finds the longest palindromic substring in a given sentence. A palindromic substring reads the same forwards and backwards. The function should ignore spaces, punctuation, and case. If there are multiple palindromic longest_substring of the same length, return the first one found. - Uy

# Test cases
puts longest_palindromic_substring("Madam Arora teaches malayalam") # "malayalam"
puts longest_palindromic_substring("Nurses Run") # "nursesrun"
puts longest_palindromic_substring("ABC") # "a"

- PROBLEM
  - Input:
  - Output:

  - Rules:
    - find longest palindromic substring
    - palindromic substring is the same forwards and backwards
    - ignore spaces, punctuation
    - if there are multiple palindromic substring. return the first one found

- EXAMPLE
  - Madam Arora teaches malayalam
    - malayalam
- DATA STRUCTURE
  - need an array to store all of the  palindromic substring

- ALGORITHM
  - create an string  to reassign everytime longest substring is found
  - transform given string into array of chars
  - transform the substring to downcase and join them together
  - find all of the substring
    - iterate through each element of the string
      - iterate through the rest of elements
  - select palindromic longest_substring
  - select the palindromic word that has longest length
    - sort the longest_substring by size
=end

def longest_palindromic_substring (sentence)
  longest_substring = ""

  string = sentence.split.join.downcase
  
  (0..string.size - 1).each do |left_index|
    (left_index..string.size - 1).each do |right_index|
      substring = string[left_index..right_index] 
      
      if substring == substring.reverse && substring.size > longest_substring.size
        longest_substring = substring
      end
    end
  end

  longest_substring
end

p longest_palindromic_substring("Madam Arora teaches malayalam") # "malayalam"
p longest_palindromic_substring("Nurses Run") # "nursesrun"
p longest_palindromic_substring("ABC") # "a"