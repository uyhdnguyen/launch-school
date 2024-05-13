=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.


PROBLEM
-------
- input: string of integers
- output: integer that represents total of  odd-numbered substrings 

- any consecutive that has at least one odd number

EXAMPLES
--------
"1341"
1 13 (134) 1341
3 (34) 341
(4) 41
1

1 1 3 13 41 341 1341

odd numbers are :
1 1 3 13 41 341 1341
-> 7

1357
1 13 135 1357
3 35 357
5 57
7
DATA STRUCTURES
---------------
- odd_numbered_count
- helper method to determine odd substrings

ALGORITHM
---------
- helper method to determine odd substrings
  - input: array of integers in string format
  - output: true/false

  - transform array of integers in string format to array of integers
  - any of the element is odd?
  - return true/false
----------------------------------------------------

- create an array contains all of the odd number substrings
  - `odd_number_substrings`
- transform given string into array of integers in string format
  - `strings`
- find all of the consecutive substrings
  - iterate through all of the element from `strings`index(0 -> last)
    - increase the range from 0 to last element - idx
      - return substrings to `odd_number_substrings` if the substrings contains odd numeber(s)
        - odd_substrings?
- return the size of odd_number_substrings

=end
def odd_substrings?(arr)
  arr.map(&:to_i).last.odd?
end

def odd_numbers_substrings(str)
  odd_number_substrings = []

  strings = str.chars
  (0...strings.size).each do |idx|
    (1..strings.size - idx).each do |range|
      substring = strings[idx,range]

      odd_number_substrings << substring if odd_substrings?(substring)
    end
  end

  odd_number_substrings.size
end

p odd_numbers_substrings("1341") == 7
p odd_numbers_substrings("1357") == 10 
p odd_numbers_substrings("13471") == 12
p odd_numbers_substrings("134721") == 13
p odd_numbers_substrings("1347231") == 20
p odd_numbers_substrings("13472315") == 28
