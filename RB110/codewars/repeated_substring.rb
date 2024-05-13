=begin
For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times.

The input string consists of lowercase latin letters.

Your function should return :

a tuple (t, k) (in Python)
an array [t, k] (in Ruby and JavaScript)
in C, return k and write to the string t passed in parameter

PROBLEM
-------
- input: non-empty string
- output: array [t, k]

- no empty string (s)
- find minimum substring (t)
- find maximum number (k)
- s = t * k

EXAMPLES
--------
"ababab" 
a ab aba abab ababa ababab
b ba bab baba babab
a ab aba abab
b ba bab
a ab
b


-> (t = "ab", k = 3)

"ababab".size = 6
"a".size = 1
"a" * 6 = "aaaaaa"

"ababab".size = 6
"ab".size = 2
"ab" * 3 = "ababab"


"abcde"
-> (t = "abcde", k = 1)

DATA STRUCTURES
---------------
- target string contain required substring to get the given string

ALGORITHM
---------
- create a variable to get the multiplier for substring
  - `multiplier` = 0
- find the target substring
  - iterate through given string index(0 -> last)
    - `idx`
    - create the range for substring
      - 1 -> last - idx
    - create substring
    - set the `multiplier` to result of divising str.size by the size of substring
    - return the substring & multiplier in array format if substring * multiplier == given string
=end

# def repeated_substring(str)
#   multiplier = 0

#   (0...str.size).each do |idx|
#     (1..str.size - idx).each do |range|
#       substring = str[idx, range]

#       multiplier = str.size / substring.size

#       multiplied_str = substring * multiplier

#       return [substring, multiplier] if multiplied_str == str
#     end
#   end
# end

def repeated_substring(str)
  (1..str.size).each do |range|
    substring = str[0, range]

    multiplier = str.size / substring.size

    multiplied_str = substring * multiplier

    return [substring, multiplier] if multiplied_str == str
  end 
end
p repeated_substring "ababab"
p repeated_substring "abcde"