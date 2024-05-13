=begin
17. Write Number in Expanded Form

(https://www.codewars.com/kata/5842df8ccbd22792a4000245)

6 kyu

Write Number in Expanded Form

You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'

expanded_form(42); # Should return '40 + 2'

expanded_form(70304); # Should return '70000 + 300 + 4'

NOTE: All numbers will be whole numbers greater than 0.

If you liked this kata, check out part 2!!

PROBLEM
-------
- input: integer
- output: string represents the input in expanded form

- no empty input
- no negative number
- whole number

EXAMPLES
--------
12
-> '10 + 2'

42
-> '40 + 2'

70304
-> '70000 + 300 + 4'

304 
-> '300 + 4'
DATA STRUCTURE
--------------
- array contains all of the remainders

ALGORITHM
---------
- create helper method called `get_remainder`
  - input: integer number
  - output: remainder integer

  - return num if num.to_s.size == 1

  - find the size of given number
    - `num_size`
  - find the division
    - `division` = 10 ** (num_size - 1)
  - find and return num the remainder
    - given num % `divison`
---------------------------------------------

- create array contains all of the remainders
- 
- create division (10, 100, 1000, 10000...)


=end

# def get_remainders(num, result = [])
#   return result if num == 0

#   num_size = num.to_s.size
#   division = 10**(num_size-1)
#   remainder = num % division

#   result << num - remainder
#   get_remainders(remainder, result)
# end

# def expanded_form(num)
#   remainders = get_remainders(num)
#   remainders.join(" + ")
# end

# def expanded_form(num)
#   num.digits
      .
#      .map.with_index { |d, idx| d.to_i * 10**idx }
#      .reject(&:zero?)
#      .reverse
#      .join (' + ')
# end

p expanded_form(42) #== '40 + 2'
p expanded_form(70304) #== '70000 + 300 + 4'
