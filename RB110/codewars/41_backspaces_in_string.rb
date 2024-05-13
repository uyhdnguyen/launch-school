=begin
FIRST TRY 12 MINS
41. Backspaces in string

(https://www.codewars.com/kata/5727bb0fe81185ae62000ae3/train/ruby)

6 kyu

Assume "#" is like a backspace in string. This means that string "a#bc#d" actually is "bd"

Your task is to process a string with "#" symbols.

Examples

"abc#d##c" ==> "ac"

"abc##d######" ==> ""

"#######" ==> ""

"" ==> ""

PROBLEM
-------
- # is backspace
- return new string that is shorter after removing letters and #s
- input is in lower case
- only alphabetical chars

EXAMPLES
--------
"abc#d##c"
-> "ac"

'abc####d##c#'

-> ""

DATA STRUCUTRURES
-----------------
- input: string that contains #s

- array contains all of the chars in given string
- array contains the result for the output

- output: string that have #s and shorter in size

ALGORITHM
---------
- create array contains the result for the output
  - result = []
- transform given string into array contains all of the chars in given string
  - chars = str.char
- create the output as required
  - iterate through all chars in chars
    - if current char is # -> pop last element out of result
      - pop
    - else add current char to result
      - <<
- transform and return result array as string 

=end

def clean_string(str)
  result = []

  chars = str.chars

  chars.each do |chr|
    chr == "#" ? result.pop : result << chr
  end

  result.join
end

p clean_string('abc#d##c') == "ac"

p clean_string('abc####d##c#') == ""
