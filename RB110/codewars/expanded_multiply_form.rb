=begin
PROBLEM
-------
- given a string of text
- expand the string as follow
- number represents the occurrence of following letter
- empty string should return empty string
- no numbers in given string, return the string

EXAMPLES
--------
3Mat
-> MMMaaattt

3M123u42b12a
-> MMMuuubbaa
multiplier = 3
MMM
multiplier = 1
multiplier = 2
multiplier = 3
uuu
multiplier = 4
multiplier = 2
bb
multiplier = 1
multiplier = 2
aa

DATA STRUCTURES
---------------
- input: string that contains numbers and letters

- empty string to build the ouput
- current_multiplier

- output: string that in expanded form

ALGORITHM
---------
- create empty string to build the ouput
  - result |
- create ouput
  - iterate through each char of given string
    - if it's number -> multiplier = num
      - char.to_i.to_s == char then it's int
    - else add the char * multiplier to result
- return the result
=end

def expanded_form(str)
  result = ""
  multiplier = 1

  str.each_char do |chr|
    if chr.to_i.to_s == chr
      multiplier = chr.to_i
    else
      result << chr * multiplier
    end
  end

  result
end

p expanded_form("3M123u42b12a") == "MMMuuubbaa"
p expanded_form("3M2u5b2a1s1h2i1r") == "MMMuubbbbbaashiir"
p expanded_form("3Mat") == "MMMaaattt"
p expanded_form("") == ""
p expanded_form("airforce") == "airforce"
