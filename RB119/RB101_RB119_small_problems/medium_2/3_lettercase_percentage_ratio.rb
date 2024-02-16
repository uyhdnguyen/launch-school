=begin

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters, as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3 entries: one represents the percentage of characters in the string that are lowercase letters, one the percentage of characters that are uppercase letters, and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples
- PROBLEM
  - Input: 
  - Output: 

  - Rules:
    - Explicit:
      - given string -> return a hash
      - hash contain 3 entries {lowercase: 50, uppercase: 30, :neither 20}
      - string always contains 1 letter
    - Implicit:
      - number string is consider :neither
      - operator string is consider :neither
      - space is :neither

- EXAMPLES AND TEST CASES
  letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
  letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

- DATA STRUCTURE
  - Input:  
  - Output: 
  - Array? Hash? Combination?

- ALGORITHM
  - initialize `result` hash that contains all types with initial 0.0 value
  - initialize `LOWERCASE`, `UPPERCASE` characters
  - convert string into array of charracter called `strings`
  - iterate through `strings`
    - if character is in LOWERCASE, increse by 1
    - if character is in UPPERCASE, increase by 1
    - else increase :neither by 1
  - gets the `total_chars` from `result` values
  - reassign :lowercase to new percentage
  - reassign :uppercase to new percentage
  - reassign :neither to new percentage
  - return the result
=end

# LOWERCASE = ("a".."z").to_a
# UPPERCASE = ("A".."Z").to_a

# def letter_percentages(string)
#   result = {lowercase: 0.0, uppercase: 0.0, neither: 0.0}
#   strings = string.split('')

#   strings.each do |char|
#     if LOWERCASE.include?(char)
#       result[:lowercase] += 1
#     elsif UPPERCASE.include?(char)
#       result[:uppercase] += 1
#     else
#       result[:neither] += 1
#     end
#   end

#   total_chars = result.values.sum

#   result[:lowercase] = (result[:lowercase] / total_chars) * 100
#   result[:uppercase] = (result[:uppercase] / total_chars) * 100
#   result[:neither] = (result[:neither] / total_chars) * 100

#   result
# end

def letter_percentages(string)
  hash = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z' }

  hash.transform_values do |regex|
    (string.count(regex) * 100.0 / string.size).round(1)
  end
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

