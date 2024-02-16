=begin
Given a string of integers, return the number of odd-numbered substrings that can be formed.

For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.

solve("1341") = 7. See test cases for more examples.
=end

=begin

- PROBLEM
  - Input: string of integers
  - Output: combinations of odd-numbered substrings

  - Rules:
    - Explicit:
      - Combinations is form from odd-numbered substring
      - Return total of combinations
    - Implicit:
      - Combinations can be duplicated
      - Combinations are formed by picking continuos indices in given string
      - Combinations are formed by compare and combine by the first index to the
      other index and so on
      - Combinations should be formed by 1 digit and increase

- EXAMPLES AND TEST CASES
  - solve("13471") == 12
  - Combinations: 1,3,7,1,13,47,71,347,471,1347,3471,13471

- DATA STRUCTURE
  - String (input)
  - Integer (output)
  - Array of string combinations

- ALGORITHM
  - Define a method call 'solve' that has one parameter 'string'
  - Create new counter for combinations
  - Iterate through each character of INPUT string
    - Push each element converted to integer to new array if it is odd
    - Iterate th

=end


p solve("1341") == 7 1,3,1,13,41,341,1341
p solve("1357") == 10 1,3,5,7,13,35,57,135,357,1357
p solve("13471") == 12 1,3,7,1,13,47,71,347,471,1347,3471,13471
p solve("134721") == 13
p solve("1347231") == 20
p solve("13472315") == 28
