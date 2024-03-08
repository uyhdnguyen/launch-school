=begin
35. Mexican Wave

(https://www.codewars.com/kata/58f5c63f1e26ecda7e000029/train/ruby)

6 kyu

In this simple Kata your task is to create a function that turns a string into a Mexican Wave. You will be passed a string

and you must return that string in an array where an uppercase letter is a person standing up.

Rules

1. The input string will always be lower case but maybe empty.

2. If the character in the string is whitespace then pass over it as if it was an empty seat.

PROBLEM
-------
- turn string into a mexican wave
- return the string in an array where an uppercase letter is a person standing
- input in lower case, can be empty
- pass over spaces

EXAMPLES
--------
hello
["Hello", "hEllo", "heLlo", "helLo", "hellO"]

""
[]

"two words"
["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs","two wordS"]
T
W
O

W
...

" gap "
[" Gap ", " gAp ", " gaP "]

DATA STRUCTURES
---------------
- input: string 

- array contains all of the mexican wave strings

- outpout: array contains mexican wave string

ALGORITHM
---------
- create array contains all of the mexican wave strings
  - mexican_waves | []
- iterating through all chars in given string
  - return transform string to mexcian_waves
- return the mexican_waves
=end

def wave(str)
  mexican_waves = []
  (0...str.size).each do |idx|
    if str[idx] == ' '
      next
    else
    mexican_waves << str[0...idx] + str[idx].upcase + str[idx + 1...str.size]
    end
  end

  mexican_waves
end

p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]

p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs","codewarS"]

p wave("") == []

p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs","two wordS"]

p wave(" gap ") == [" Gap ", " gAp ", " gaP "]