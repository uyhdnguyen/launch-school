=begin
29. Split Strings

(https://www.codewars.com/kata/515de9ae9dcfc28eb6000001)

6 kyu

Complete the solution so that it splits the string into pairs of two characters. If the string contains an odd number of

characters then it should replace the missing second character of the final pair with an underscore ('_').

P:
--
- input: a string
- output: an array contains pairs of characters

- if the last  pairs is having odd number of elements -> add "_"
- empty string input -> []

E:
--
'abc'
-> ['ab', 'c_']

""
-> []

"abcdef"
-> ["ab", "cd", "ef"]

D:
--
- array contains all of the pairs

A:
--
- transform given string with added underscore if given string has odd number of elements
  - size, odd?, ternary operator
- array contains all of the pairs
  - pairs |
- find all pairs of the given string
  - call the step method on range from (0 -> size of the string - 1)
    - slice to get the pairs and return to pairs
- return pairs
=end

def solution(str)
  str = str.size.odd? ?  str + "_" : str

  pairs = []

  (0..str.size - 2).step(2) do |idx|
    pairs << str[idx, 2]
  end

  pairs
end

# def solution(str)
#   str = str.size.odd? ?  str + "_" : str

#   pairs = []

#   0.step(str.size - 2, 2) do |idx|
#     pairs << str[idx, 2]
#   end

#   pairs
# end

p solution('abc') == ['ab', 'c_']

p solution('abcdef') == ['ab', 'cd', 'ef']

p solution("abcdef") == ["ab", "cd", "ef"]

p solution("abcdefg") == ["ab", "cd", "ef", "g_"]

p solution("") == []