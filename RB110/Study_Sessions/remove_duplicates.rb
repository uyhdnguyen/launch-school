=begin
Given a string S of lowercase letters, a duplicate removal consists of choosing two adjacent and equal letters, and removing them.

We repeatedly make duplicate removals on S until we no longer can.

Return the final string after all such duplicate removals have been made. It is guaranteed the answer is unique.

remove_duplicates('aaybbyz') == "z"
remove_duplicates("abbaca") == "ca"
remove_duplicates("mppmhkkl") == "hl"

- PROBLEM
  - Input: lower-case string
  - Output: lower-case string
    - given a string S of lowercase letters
    - remove duplicated adjacent letters
    - repeatedly remove duplicated adjacent letter
    - aaybbyz
      -> ybbyz
      -> yyz
      -> z (return value)

  - Rules:
    - Explicit:
      - given lower-case string
      - remove duplicated adjacent letters
      - repeat the process of removal

    - Implicit:
      - if characters are duplicated but not adjacent -> leave it there
      - if given single-letter string -> return the string
      - return new string

- EXAMPLES AND TEST CASES
  - remove_duplicates('aaybbyz') == "z"

- DATA STRUCTURE
  - Input: string
  - Output: string
  - Use Array in the process to take advantage of its methods

- ALGORITHM
  - initialize a result array
  - convert input string to an array
  - iterate through the array
    - check if the last element of result array is equal to current char
      - if no, push current char to result
      - else, remove last element of the result
  - return result

=end

def remove_duplicates(string)

string.chars.each_with_object([]) do |char, temp|
    if temp.last != char
      temp << char
    else
      temp.pop
    end
  end.join

end

p remove_duplicates('aaybbyz')
p remove_duplicates("abbaca")
p remove_duplicates("mppmhkkl")