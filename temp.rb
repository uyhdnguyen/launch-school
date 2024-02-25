=begin
[Train: Alphabetized \| Codewars](https://www.codewars.com/kata/5970df092ef474680a0000c9/train/ruby)
6 kyu
The alphabetized kata
Re-order the characters of a string, so that they are concatenated into a new string in "case-insensitively-alphabetical-order-of-appearance" order. Whitespace and punctuation shall simply be removed!

The input is restricted to contain no numerals and only words containing the english alphabet letters.

Example:(2)

alphabetized("The Holy Bible") # "BbeehHilloTy"
=end

=begin


- PROBLEM
  - Input: string that contains characters
  - Output: new string with requirements below

  - Rules:
    -re-order the characters of a String
    - return a new string
      - not case sensitive
      - do not need to worry about the order of lowercase and uppercase letter
      - alphabetical order
      - remove the Whitespace and punctuation
    - dont need to verify the inputs

- EXAMPLE
  -alphabetized("The Holy Bible") # "BbeehHilloTy"

- DATA STRUCTURE
  - should be an array so we can iterate through all of the characters.

- ALGORITHM
  - transform given string into an array of characters
  - sort all of the characters based on their order in alphabet
  - return the result
=end

# def alphabetized(string)
#   string.split.sort_by {|char| char.upcase}.join
# end

# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"


# A:

# delete all non alpha chars in the string
# convert cleaned string to array
# iterate over the array and sort ascending
#  convert sorted array back to string

# def alphabetized(string)
#   string.gsub(/[^a-zA-Z]/, '').chars.sort { |a, b| a.downcase <=> b.downcase}.join
# end

# p alphabetized("The Holy Bible") == "BbeehHilloTy"
# p alphabetized("") == ""
# p alphabetized(" ") == ""
# p alphabetized(" a") == "a"
# p alphabetized("a ") == "a"
# p alphabetized(" a ") == "a"
# p alphabetized("A b B a") == "AabB"
# p alphabetized(" a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z") == "aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ"

# puts

# - ALGORITHM
#   - split to characters so that you have an array, remove spaces

# - start building `return_string`

# - initialize alphabet, lower and upper case

# - iterate over the alphabet of both uppercase and lower case and see if A/a is included in the string

# - get index of a OR A

# - see which index is smaller in the input string and get the character at that index, append it to the `result_str`

# - then remove that character from the input string

# - repeat this process until there is no more uppercase/lowercase letters in the array - helper method

# - if you're done with upercase letter, try its lowercase letter and VICE VERSA

# -move to the next letter in the alphabet

# - once done with all the letters in the alphabet, return the string

# is the letters h/H in my input string?

lowercase = ("a".."z").to_a #1
uppercase = ("A".."Z").to_a #4


# temp_arr = []

# counter = 0
# is the ltter at counter 0 in uppercase alphabet (A) is it in the input str?
# is the ltter at counter 0 in lowercase alphabet (a) is it in the input str?
# if it's only a/A, then get its index, remove it and append it to return str 
# - if the asnwer is yes
# - which one comes FIRST?
# -count As and as?
# find all indices of As and all indices of 'a's
# -extract all capital As and lowercase as ,and then append them to the result string
# -MOVE ON to the next letter and do the same

# - is the letter in the INPUT STRING?

# - consider both 
# -yes
# -find me the index of A, find me the index of a in the INPUT STRING
# -which index is earlier?
# -

# alphabet = ["A", "a", "B", "b","C"......


# p alphabetized("The Holy Bible") == "BbeehHilloTy"

string = "The Holy Bible"

alphabet.each.with_index do |char, index|       #h, H
  string if string.include?(char)
end                                 


# ["A", "a", "B", "b", "C", "c", "D", "d", "E", "e", "F", "f", "G", "g", "H", "h", "I", "i", "J", "j", "K", "k", "L", "l", "M", "m", "N", "n", "O", "o", "P", "p", "Q", "q", "R", "r", "S", "s", "T", "t", "U", "u", "V", "v", "W", "w", "X", "x", "Y", "y", "Z", "z"]


# ALGORITHM
# - transform given string into an array of downcase characters
# - create result array that contains the count of each characters in  given string
# - select any characters that has the count greater than 2
# - return the size of selected array

def duplicate_count(string)
  string = string.chars.uniq.map(&:downcase)

  string.map {|char| string.count(char)}
        .select {|count| count >= 2}
        .size
end


p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2


# a b c d e a B

=begin
[Train: Counting Duplicates \| Codewars](https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/ruby)
6 kyu
Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphabets (both uppercase and lowercase) and numeric digits.

Example
"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabBcde" -> 2 # 'a' occurs twice and 'b' twice (`b` and `B`)
"indivisibility" -> 1 # 'i' occurs six times
"Indivisibilities" -> 2 # 'i' occurs seven times and 's' occurs twice
"aA11" -> 2 # 'a' and '1'
"ABBA" -> 2 # 'A' and 'B' each occur twice
=end

=begin

PROBLEM
======
Desc.
----
  Given an Input String of alphanumeric caharacters, determine and return the amount of characters that occur more than once.

Rules
----
  + Explicit
    - treat letters with CASE INSENSITIVY : "b" : "B"

  + Implicit


Notes
-----
* not about highest count

EXAMPLES
========
1."abcde" -> 0 
# no characters repeats more than once
max count of any char : 1

2.
"aabbcde" -> 2 
# 'a' and 'b' both occur twice

3.
"aabBcde" -> 2 
# 'a' occurs twice and 'b' twice (`b` and `B`)

4.
"indivisibility" -> 1 
# 'i' occurs six times

5.
"Indivisibilities" -> 2 
# 'i' occurs seven times and 's' occurs twice

"aA11" -> 2 
# 'a' and '1'

"ABBA" -> 2 
# 'A' and 'B' each occur twice


DATA STRUCTURES
===============
Input : String
  + alphanumeric characters only

Intermediate : Hash

Output : Integer


ALGORITHM
=========
+ if Input is empty, return `0`
+ create Count Hash to capture unique characters and their counts
+ create an Array of unique characters from Input, converted to lowercase
+ create Final Count, initialize to `0`

+ iterate over all unique characters
  + create a `count` variable
  + iterate over all characters in Input
    + if the lowercase version of the current character is the same as the current unique character, increment `count` by 1
    + otherwise, skip
  + create new Count Hash element where key is current unique char and value is current count


+ iterate over elements in Count Hash
  + if value of current element is greater than `1`,
    + increment Final Count by 1
  + otherwise, skip

+ return Final Count

=end

# def duplicate_count(str)
#   return 0 if str.empty?

#   count_hash = {}
#   unique_chars = str.chars.map! {|char| char.downcase}.uniq
#   final_count = 0

#   unique_chars.each do |unique_char|
#     count = 0
#     str.chars.each do |char|
#       lower = char.downcase
#       count += 1 if lower == unique_char
#     end
#     count_hash[unique_char] = count
#   end

#   count_hash.each do |k, v|
#     final_count += 1 if v > 1
#   end

#   final_count

# end


# p duplicate_count("") == 0
# p duplicate_count("abcde") == 0
# p duplicate_count("abcdeaa") == 1
# p duplicate_count("abcdeaB") == 2
# p duplicate_count("Indivisibilities") == 2


# def duplicate_count_2(str)
#   # use `#each_with_object`...


# end
# p duplicate_count_2("") == 0
# p duplicate_count_2("abcde") == 0
# p duplicate_count_2("abcdeaa") == 1
# p duplicate_count_2("abcdeaB") == 2
# p duplicate_count_2("Indivisibilities") == 2

# puts  

# A:
# - downcase the str
# - tally the characters
# - remove all keys which have value 1
# - iterate over the keys and values that you have left
# - return the number of keys, we don't need to do anything with the values because chars which are keys have to be unique

# # 3.0.0 :002 > "Indivisibilities".downcase.chars.tally
#  => {"i"=>7, "n"=>1, "d"=>1, "v"=>1, "s"=>2, "b"=>1, "l"=>1, "t"=>1, "e"=>1}
#  => {"i"=>7, "s"=>2} ['i, 's']

def duplicate_count(str)
  str.downcase.chars.tally.select { |_, v| v >= 2 }.keys.size
end

p duplicate_count("Indivisibilities") == 2
p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
# p duplicate_count("Indivisibilities") == 2

# ALGORITHM
# - transform given string into an array of downcase characters
# - create result array that contains the count of each characters in  given string
# - select any characters that has the count greater than 2
# - return the size of selected array

# def duplicate_count(string)
#   string.chars.map(&:downcase).uniq
#               .map {|char| string.downcase.count(char)}
#               .select {|count| count >= 2 }
#               .size
# end


# p duplicate_count("") == 0
# p duplicate_count("abcde") == 0
# p duplicate_count("abcdeaa") == 1
# p duplicate_count("abcdeaB") == 2
# p duplicate_count("Indivisibilities") == 2

=begin
[Train: Backspaces in string \| Codewars](https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby)
6 kyu
Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples
"abc#d##c"      ==>  "ac"
"abc##d######"  ==>  ""
"#######"       ==>  ""
""              ==>  ""
PEDAC 23:03
P:
- we have a string with #s
- every # removes the letter before
- write a method that processes the str in the above way

E:
p clean_string('abc#d##c') == "ac"
'abc#d##c'
    # cancels c and we have 'abd##c'
    -the # and the letter before DISAPPEAR
    abd##c'
       ## cancel bd and we have 'ac'
p clean_string('abc####d##c#') == ""
=>'abc####d##c#'
=> if the no of #s is same or more than the no of letters, we return ""

DS:
input: a string with #s 
output: a string without #s and the letters that the #s deleted (because they're like a backspace)

P:
- if the no of #s is same or more than the no of letters, we return ""
-if str empty or there are only #s, return ""

- change the str to array
- iterate over the array
- build a new result array

- iterate and add each character to the result
- if I see a #, I have to delete this # AND the character before from my result array
- do it for the length of input array

  -return array that you have converted to str

=end
# def clean_string(str)
#   return "" if str.empty?
#   return "" if str.chars.all? {|c| c == '#'}
#   number_of_hashes = str.chars.count('#')
#   non_hashes = str.delete("#")
#   return "" if number_of_hashes.size >= non_hashes.size

#   arr = str.chars
#   result = []
#   counter = 0
#   loop do
#     current_char = arr[counter]
#     result << current_char
#     if arr[counter.next] == '#'
#       result.pop
#       p result
#       counter += 2
#     end
#     break if counter == nil
#   end
#   # result
# end
# p clean_string('abc#d##c')# == "ac"
# p clean_string('abc####d##c#') == ""
# p clean_string("#######") == ""
# p clean_string("#######a") == ""
# p clean_string("") == ""

=begin

ALGORITHM
=========
+ create Array of characters from Input
+ create Array to capture new Characters

+ iterate over Characters Array
  + if current character is `#`,
    - remove last character in Array of New Characters
    - ** do not include in New Characters Array **
  + otherwise, 
    - add current character to New Characters Array

+ build New String from New Characters Array
+ return New String


=end

def clean_string(str)
  new_chars = []
  chars = str.chars

  chars.each do |char|
    if char == '#'
      new_chars.pop
    else
      new_chars << char
    end
  end

  # new_chars

  new_str = new_chars.join
end

p clean_string('abc#d##c') == "ac"
p clean_string('abc####d##c#') == ""
p clean_string("#######")       ==  ""
p clean_string("")              ==  ""
# p clean_string("123#456##abcde###f#") == "124ab"
# p clean_string("shenanigans##not##so#fast####") == "shenanigans"

# ALGORITHM
# - find the sum of all of the elements
# - find the closest prime number
#   - create a list of prime number
#     - 
#   - find the prime numbers that is greater than sum
#   - return the prime number
# - find the result of the prime - the sum of all elements
# prime number = [1,3,5,7,11,13,17,19,23]

def create_prime_number(sum)
  prime_number = 0
  counter = 1

  loop do
    prime_number = 6 * counter + 1
    counter += 1
    break if prime_number > sum
  end
  prime_number
end

def minimum_number(integers_array)
  total = integers_array.sum
  create_prime_number(total) - total
end

p minimum_number([3,1,2]) #== 1
p minimum_number([5,2]) #== 0
p minimum_number([1,1,1]) #== 0
p minimum_number([2,12,8,4,6]) #== 5
p minimum_number([50,39,49,6,17,28]) #== 2

def string_transformer(string)
  # transform given string into its swapped cases then reverse the whole string
  new_string = string.chars.map do |char|
  char.swapcase
  end.join

  # transform reversed words back to normal
  left_index = 0
  right_index = 0
  result = ""

  new_string.chars.each.with_index do |element, index|
    if element == " "
      right_index -= 1
      result << new_string[left_index..right_index]
      result<< " "
      right_index = index
      left_index = right_index + 1
    end

    right_index += 1
  end

  result
end
p string_transformer("You Know When   THAT  Hotline Bling") 

spaces_array = []
length = 0
input.each_char do |char|
  if char == " "
    length += 1
  else
    spaces_array << length if length > 0
    length = 0
  end
end
p spaces = spaces_array

p reversed_words = input.split.reverse.map(&:swapcase)

result = ""
reversed_words.each_with_index do |word, index|
  result << word
  result << " " * spaces[index] unless index == reversed_words.size - 1
end

