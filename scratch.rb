=begin
P - Understanding the Problem:
- Goal: understand what you're being asked to do
  - Read the problem description
  - Identify expected input and output
  - Establish rules/requirements/define the boundaries of the problem
  - Ask clarifying questions
  - Take your time on this step!

E - Examples and Test Cases:
- Goal: further expand and clarify understanding about what you're being asked to do 
  - Use examples/test cases to confirm or refute assumptions made about the problem in the previous step

D - Data Structures:
- Goal: begin to think logically about the problem
  - What data structures could we use to solve this problem?
    - What does our data look like when we get it? (input)
    - What does our data look like when we return it? (output?)
    - What does our data need to look like in the intermediate steps?

A - Algorithm:
- Goal: write out steps to solve the given problem in plain English
  - A logical sequence of steps for accomplishing a task/objective
  - Start high level, but make sure you've thought through and have provided sufficient detail for working through the most difficult parts of the problem
  - Stay programming-language-agnostic
  - Can create substeps for different parts or separate concerns into a helper method
  - You can (and should) revisit your algorithm during the implementation stage if you need to refine your logic
  - Before moving onto implementing the algorithm, check it against a few test cases

C - Implementing a Solution in Code:
- Goal: translate the algorithm into your programming language of choice
  - Code with intent. Avoid hack and slash 
- TEST FREQUENTLY
  - Use the REPL or run your code as a file
  - When testing your code, always have an idea in place of what you're expecting
  - If you find that your algorithm doesn't work, return there FIRST if needed and THEN fix your code
=end


=begin

Check if a given string can be constructed by taking a substring of it and appending multiple copies of the substring together

Input: String
Output: true or false
Rules: if a substring of the input string can be multiplied by a certain number to create the input string, return true otherwise false
all the characters are lower case
no nonalphabaetic string characters

Data structure: string to store substrings or substrings in an array

Algorithm:
--create an array with all substrings
  --iterate through each position of the char and create all possible substring at each position 
  --
--variable named num = input string size / substring.size
--return substring if substring x num = input string


p repeated_substring_pattern("abab") == true
p repeated_substring_pattern("aba") == false
p repeated_substring_pattern("aabaaba") == false
p repeated_substring_pattern("abaababaab") == true
p repeated_substring_pattern("abcabcabcabc") == true
=end

def repeated_substring_pattern(str)
  str.size.times do |index1|
    (index1 + 1).upto(str.size - 2) do |index2|
      substring = str[index1..index2]
      num = str.size / substring.size
      return true if substring * num == str
  end
end
false
end

# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabc") == true


# repeated_substring_pattern("aaaaaaaaaa")


=begin
RJ
Problem: Check if a given string can be constructed by taking a substring of it and appending multiple copies of the substring together

Is it the same if you copy it?

repeated_substring_pattern (’abab’) == true

repeated_substring_pattern (’abaa’) == false

Input: A string like abab >> true

Output: a string

questions: 

A new string? Mutated of original?

What substring are we inputing??

Data structure: 

must count/store characters of the string

find a pattern

replicate pattern

how to do this? How many characters count? 

#chars == other char?

Algo:

Store string into an array

iterate over the array to find multiple matching characters

if characters match, true

else, false
=end

=begin
Udeshika
P :
- Using a substring whether the original str can be build or not
- input - string
- output - boolean

E :
repeated_substring_pattern("abab") == true
 - 'ab' can be taken as substring to construct 'abab'

repeated_substring_pattern("aba") == false
 - 'aba' can't be build by substring

repeated_substring_pattern("aabaaba") == false
 -
p repeated_substring_pattern("abaababaab") == true

repeated_substring_pattern("abcabcabcabc") == true
 - 'abc' substring can be used to build the original str

 D:
 str array

A :
 Iterate through str array by adding next character to it
 example : abab
 [a]
 [ab]
 [ab]
 [abab]
-check in each iteration whether it is equal to original str
  - check the length of sub string 
  


def repeated_substring_pattern(word)
  sub_str = ''
  word_length = word.length
  word.each_char do |char|
    sub_str << char
    num = word_length / sub_str.length
    return true if sub_str * num == word
  end
  false
end
=end

=begin - Uy

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


def repeated_substring_pattern(str)
  (1..str.size / 2).each do |range|
    
    substring = str[0,range]

    multiplier = str.size / substring.size

    return true if substring * multiplier == str
  end

  false
end
=end

def repeated_substring_pattern(str)
  (1..str.size / 2).each do |range|
    
    substring = str[0,range]

    multiplier = str.size / substring.size

    return true if substring * multiplier == str
  end

  false
end

p repeated_substring_pattern("abab") #== true
p repeated_substring_pattern("aba") #== false
p repeated_substring_pattern("aabaaba") #== false
p repeated_substring_pattern("abaababaab") #== true
p repeated_substring_pattern("abcabcabcabc") #== true

=begin
https://fine-ocean-68c.notion.site/RB101-934e6196044d425f9b2f23830ead6534?p=b1b328603eea4cfb9d9dbf39b0033d67&pm=s
=end

=begin

You are given an array (which will have a length of at least 3, but could be very large) containing integers. The array is

either entirely comprised of odd integers or entirely comprised of even integers except for a single integer N. Write a

method that takes the array as an argument and returns this "outlier" N.

Examples

[2, 4, 0, 100, 4, 11, 2602, 36]

Should return: 11 (the only odd number)

[160, 3, 1719, 19, 11, 13, -21]

Should return: 160 (the only even number)

PROBLEM
-------
- INPUT:  an array with size of 3 contains integeres
- OUPUT: an integer that is the only different integer in given arr

- all odd integers/ all even integers but one integer even/odd
- no empty arr input
- the array can have negative and positive integers

EXAMPLES
--------
[2, 4, 0, 100, 4, 11, 2602, 36]
[TRUE TRUE TRUE TRUE TRUE FALSE TRUE TRUE]
-> 11

[160, 3, 1719, 19, 11, 13, -21]
[TRUE,  FALSE]
-> 160

DATA STRUCTURES
---------------
- use reject method

ALGORITHM
---------
- select 2 options
  - reject all of odd integers
  - reject all of even integers
  - return the result if whichever results has 1 element
=end

def find_uniq_integer(arr)
  [arr.reject(&:odd?), arr.reject(&:even?)].select {|sub| sub.size == 1}.first.first
end

p find_uniq_integer [2, 4, 0, 100, 4, 11, 2602, 36]
p find_uniq_integer [160, 3, 1719, 19, 11, 13, -21]


# 
def find_parity(list)
  number_lists = list.partition {|number| number.even?}
  evens = number_lists[0]
  odds = number_lists[1]
  if evens.size < odds.size
    return evens.first
  else
    return odds.first
  end
end

p find_parity([2, 4, 0, 100, 4, 11, 2602, 36])
# Should return: 11 (the only odd number)

p find_parity([160, 3, 1719, 19, 11, 13, -21])

=begin
27. Exponent method
(https://www.codewars.com/kata/5251f63bdc71af49250002d8)
5 kyu
Create a method called "power" that takes two integers and returns the value of the first argument raised to the power
of the second. Return nil if the second argument is negative.
Note: The ** operator has been disabled.
Examples:
p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil

PROBLEM
-------
- input: 2 integers
- output: integer that is the result of raising the first int to the power of second int

- method `power`
- return nil if second int is < 0
- `**` IS NOT ALLOW

EXAMPLES
--------
2, 3 -> 2 ** 3 -> 8
2 * 2 * 2

-5, 3 -> -5 ** 3 -> -125
-5 * -5 * 5

8, -2 -> 8 ** -2 -> NIL

DATA STRUCTURES
---------------
- perform all of the expression without using arrays

ALGORITHM
---------
- RETURN nil if second_int is negative
- create a variable to keep track of the multiply
  - `result` assigns to 1
- find the result
  - call `times` second_int

- return the result
=end

def power(first_int, second_int)
  return nil if second_int < 0

  result = 1
  second_int.times { result *= first_int}

  result
end

p power(2, 3) == 8
p power(10, 0) == 1
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(10, 0) == 1
p power(2, 3) == 8
p power(3, 2) == 9
p power(-5, 3) == -125
p power(-4, 2) == 16
p power(8, -2) == nil