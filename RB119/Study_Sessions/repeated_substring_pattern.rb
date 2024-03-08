=begin
Check if a given string can be constructed by taking a substring of it and appending multiple copies of the substring together

p repeated_substring_pattern(""abab"") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true

PROBLEM
-------
- given string
- find the substring that can be multiplied to get to the original string
- no empty input string
- given string is in lowercase format
- return true/false if there are substring that can be multiplied

EXAMPLES
--------
abab
true (ab * 2)

aba
false

aabaaba
false

abaababaab
true (abaab * 2)

"abcabcabcabc"
true (abc * 3)

DATA STRUCTURES
- input: string contains lowercased characters
- output: true/false if there are substring that can be multiplied

- a variable to keep track of the multiply value
  - multiplier
- a variable to increase the range of substring
  - range

ALGORITHM
---------
- find the substring that can be multiplied that is equal to given string
  - create substring from element at index 0 middle index
    - create a range from 1 to the size of given string
      - (1..str.size / 2 )
    - for each substring
    - get multiplier value ( str.size / substring.size)
    - check
       - return true if substring multiplied by multiplier is equal to given string
  - always return false if there are no substring

=end

def repeated_substring_pattern(str)
  (1..str.size / 2).each do |range|
    
    substring = str[0,range]

    multiplier = str.size / substring.size

    return true if substring * multiplier == str
  end

  false
end


p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
