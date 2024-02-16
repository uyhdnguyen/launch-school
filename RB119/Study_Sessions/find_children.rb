=begin
[Train: Where is my parent!?(cry) \| Codewars](https://www.codewars.com/kata/58539230879867a8cd00011c/train/ruby )
Where's my parent?
6 kyu

Mothers arranged a dance party for the children in school. At that party, there are only mothers and their children. All are having great fun on the dance floor when suddenly all the lights went out. It's a dark night and no one can see each other. But you were flying nearby and you can see in the dark and have ability to teleport people anywhere you want.

Legend:
-Uppercase letters stands for mothers, lowercase stand for their children, i.e. "A" mother's children are "aaaa".
-Function input: String contains only letters, uppercase letters are unique.
Task:
Place all people in alphabetical order where Mothers are followed by their children, i.e. "aAbaBb" => "AaaBbb".
=end

=begin

PROBLEM
=======
Desc.
  Given an Input String composed of letters, where lowercase letters can repeate but uppercase letters will only occur once, return a String where uppercase and lowercase letters are sorted in alphabetical order.

Rules
-----
  + Explicit
    - 'children' can repeat (lowercase letters)
    - 'mothers' occur once (uppercase letters)
    - return String has to organize uppercase and lowercase letters in ALPHABETICAL order
  
  + Implicit
    - if a 'mother', then at least 'child'
    - no 'children' without 'mothers'
    - return an empty String if Input String is empty


EXAMPLES
========
1. 
input : abBA
  'mothers' : 'A', 'B'
  'children' : 'a', 'b'
  reconstructed : 'AaBb'
output : AaBb

DATA STRUCTURES
===============
Input : String of letters
  + a type of code
  + lowercase : "children"
  + uppercase : "mothers" -- (1) instance of each uppercase letter

Intermediate : Array

Output: String


ALGORITHM
=========

* returning an empty string is implied below

+ create empty mothers Array to capture uppercase letters
+ create empty children Array to capture lowercase letters
+ create empty families String

+ iterate over all letters in Input
  + add current letter to mothers if between A..Z
  + otherwise, add to children

+ sort letters in mothers Array alphabetically
+ sort letters in children Array alphabetically

== iterate over uppercase letters and add all corresponding lowercase letters ==
+ iterate over letters in mothers Array
  + add current mother to families String
  + iterate over letters in children Array
    + if current child has same value as lwercase version of current mother, add to families String
    + otherwise, skip
  
+ return families String

=end

# def find_children(str)
#   mothers = []
#   children = []
#   families = ''

#   str.chars.each do |char|
#     mothers << char if ('A'..'Z').include?(char)
#     children << char if ('a'..'z').include?(char)
#   end

#   mothers.sort!
#   children.sort!

#   mothers.each do |mother|
#     families.concat(mother)

#     children.each do |child|
#       families.concat(child) if child == mother.downcase
#     end

#   end

#   families

# end

# p find_children("abBA") == "AaBb"



=begin
Algorithm
- create array to contain all of the sorted letter
- transform string into array of letters
- select uppercased letter
  - select its downcased letter
- add uppercased letter
- add lowercased letter
-return the result
=end

def find_children(string)
  result = []

  chars = string.chars.sort

  uppercase_letters = chars.select do |char|
    char.upcase == char
  end

  uppercase_letters.each do |upper_char|
    chars.each do |char|
      result << char if char.upcase == upper_char
    end
  end

  result.join
end

# p find_children("abBA") == "AaBb"
# p find_children("AaaaaZazzz") #== "AaaaaaZzzz"
# p find_children("CbcBcbaA") == "AaBbbCcc"
# p find_children("xXfuUuuF") == "FfUuuuXx"
# p find_children("") == ""

# p find_children("abBA") == "AaBb"

# p find_children("AaaaaZazzz") == "AaaaaaZzzz"
# p find_children("CbcBcbaA") == "AaBbbCcc"
# p find_children("xXfuUuuF") == "FfUuuuXx"
# p find_children("") == ""

#Ewa
# ALGORITHM
# - define uppercase alphabet
# - find all the uppercase alphabet letters in the input str
# - then see HOW MANY of the lowercase letters corresponding to the uppercase letters are in the input string"
# - count them and append the count of each lowercase letter after the uppercase letter

=begin
Algorithm
- create array to contain all of the sorted letter
- transform string into array of letters
- select uppercased letter
  - select its downcased letter
- add uppercased letter
- add lowercased letter
-return the result
=end


def find_children(str)
  alphabet = ('A'..'Z').to_a

  parents = str.chars.find_all { |char| alphabet.include?(char) }.sort


  alphabet_lowercase = alphabet.map(&:downcase)
  children = str.chars.find_all { |char| alphabet_lowercase.include?(char) }

  result = []

  parents.each do |parent|
    child = parent.downcase
    number_of_kids = children.count(child)
    result.push(parent).push(child * number_of_kids)
  end

  result.join
end
p find_children("abBA") == "AaBb"
p find_children("AaaaaZazzz") == "AaaaaaZzzz"
p find_children("CbcBcbaA") == "AaBbbCcc"
p find_children("xXfuUuuF") == "FfUuuuXx"
p find_children("") == ""