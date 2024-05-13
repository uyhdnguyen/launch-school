# Write a method that takes two strings as arguments, determines the longest of
# the two strings, and then returns the result of concatenating the shorter
# string, the longer string, and the shorter string once again. You may assume
# that the strings are of different lengths.

# short_long_short('abc', 'defgh') == "abcdefghabc"
# short_long_short('abcde', 'fgh') == "fghabcdefgh"
# short_long_short('', 'xyz') == "xyz"

def short_long_short(string1, string2)
  string1.length > string2.length ? string2 + string1 + string2 : string1 + string2 + string1
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"

# p short_long_short('abc', 'defgh')
# p short_long_short('abcde', 'fgh')
# p short_long_short('', 'xyz')