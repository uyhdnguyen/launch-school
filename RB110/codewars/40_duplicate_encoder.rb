=begin
SECOND TRY 12 MINS

40. Duplicate Encoder

(https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/ruby)

6 kyu

The goal of this exercise is to convert a string to a new string where each character in the new string is "(" if that

character appears only once in the original string, or ")" if that character appears more than once in the original string.

Ignore capitalization when determining if a character is a duplicate.

Examples

"din" => "((("

"recede" => "()()()"

"Success" => ")())())"

"(( @" => "))(("

PROBLEM
-------
- convert given str into new str
  - if char is > 1 -> char => )
  - if char is 1 -> char => (
- case insensitive
- input has upper and lower cases
- input can contains non alphabetical chars ( can include spaces)

EXAMPLES
--------
din
-> (((

recede
   1 3 1 3 1 3
-> ( ) ( ) ( )

(( @
2211
))((

DATA STRUCTURES
---------------
- input: string

- new empty string to return the output

- output: string contains ()

ALGORITHM
---------
- new empty string to return the output
  - result = ""
- transform all chars as required
  - transform given string to downcase
  - iterate through all chars in the given str
    - each_char
    - if the count of current char in given str > 1
      - return close ")" to result
    -else
      - return open "(" to result
- return result

=end

def duplicate_encode(str)
  result = ""
  str = str.downcase

  str.each_char do |chr|
    if str.count(chr) > 1
      result << ")"
    else
      result << "("
    end
  end

  result
end

p duplicate_encode("din") == "((("

p duplicate_encode("recede") == "()()()"

p duplicate_encode("Success") == ")())())"

p duplicate_encode("(( @") == "))(("
