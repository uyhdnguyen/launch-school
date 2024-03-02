=begin
13. Kebabize

(https://www.codewars.com/kata/57f8ff867a28db569e000c4a/train/ruby)

6 kyu

Modify the kebabize function so that it converts a camel case string into a kebab case.

kebabize('camelsHaveThreeHumps') // camels-have-three-humps

kebabize('camelsHave3Humps') // camels-have-humps

Notes:

the returned string should only contain lowercase letters



p kebabize('myCamelCasedString') == 'my-camel-cased-string'

p kebabize('myCamelHas3Humps') == 'my-camel-has-humps'

PROBLEM
-------
- input: string in cammel case
- ouput: string in kabab case

- return string in lowercase
- no empty string

EXAMPLES:
---------
'camelsHaveThreeHumps'
-> 'camels-have-three-humps'

'myCamelCasedString'
-> 'my-camel-cased-string'

'myCamelHas3Humps'
->'my-camel-has-humps'

DATA STRUCTURES
---------------
- create empty string to build the kebab version

ALGORITHM
---------
- create empty string to build the kebab version
  - `kebab_str`
- iterate through all chars of given string
  - if char is lowercase -> add to `kebab_str`
  - else -> add dash -> add chr(lower case) to `kebab_str`
- return kebab_str
=end

# def kebabize(str)
#   numbers = ("0".."9").to_a

#   kebab_str = ""

#   str.each_char do |chr|
#     if numbers.include?(chr)
#       next
#     else
#       if chr == chr.downcase
#         kebab_str << chr
#       elsif chr == chr.upcase
#         kebab_str << "-"
#         kebab_str << chr.downcase
#       end
#     end
#   end

#   kebab_str
# end

def kebabize(str)
  str.gsub(/[0-9]/, "")
     .split(/(?=[A-Z])/)
     .map(&:downcase)
     .join("-")
end

p kebabize('myCamelCasedString') #== 'my-camel-cased-string'

p kebabize('myCamelHas3Humps') #== 'my-camel-has-humps'
