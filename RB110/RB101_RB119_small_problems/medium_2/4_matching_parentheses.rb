=begin

Write a method that takes a string as an argument, and returns true if all 
parentheses in the string are properly balanced, false otherwise. 
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Examples:

- PROBLEM
  - Input: string that contains characters and parenthesis
  - Output: boolean values true/ false

  - Rules:
    - Explicit:
      - given string
      - returns true
        - if all parentheses in the string are balanced
        - else false
        - parentheses must start (, not )
    - Implicit:
      - no parentheses -> return string
      - no need to validate inputs

- EXAMPLE/ TEST CASES
  - balanced?('Hey!') == true
  - balanced?(')Hey!(') == false
  - balanced?('What (is) this?') == true

- DATA STRUCTURE
  - Input: string
  - Output: boolean true/ false
  - Notes:
    - need constant for "(" and ")"
    - might need to convert string to array
    - might need a hash to count "(" and ")"

- ALGORITHM
  - initialize a hash with default key "(" and value 0 and ")" and value 0
  - convert string into array of characters called `strings`
  - iterate through `strings`
    - if first ")" index is smaller than first "("  index -> return false
    - if char is equal to "(" -> increase count by 1
    - if char is euqal to ")" -> increase count by 1
  - if count of both is equal -> true
  - else return false
=end

def balanced?(string)
  result = {"(" => 0, ")" => 0}

  string.chars.each do |char|
    result["("] += 1 if char == "("
    result[")"] += 1 if char == ")"
    return false if result.values.first < result.values.last
  end

  result.values.first == result.values.last
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false