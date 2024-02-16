=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

- PROBLEM
  - Input: integer of maximum size of the diamond
  - Output: diamond drawing

  - Rules:
    - Explicit:
      - diamond has n x n grid
      - n is odd integer
      - don't need to validate input
    - Implicit:
      - middle of diamond is n
      - 2 sides of the diamond is decrease by 2 each time
      - decrement of 2
      - smallest size of diamond start at 1

- EXAMPLES AND TEST CASES
  - diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

- DATA STRUCTURE
  - Input: integer of largest size of the diamond
  - Output: drawing of diamond
  - string

- ALGORITHM
  - iterate from 1 up to given diamond_size which is the center of the diamond
    - print number of * according to the odd integers  
  - iterate from diamond_size back to 1
    - print number of * according to the odd integers 
=end

def diamond(diamond_size)
  1.step(diamond_size - 1, 2) {|round| puts ("*" * round).center(diamond_size) }
  diamond_size.step(1, -2) {|round| puts ("*" * round).center(diamond_size) }
end

def outline_diamond(diamond_size)
  puts "*".center(diamond_size)

  3.step(diamond_size - 1, 2) do |round| 
    puts ("*" + " " * (round - 2) + "*").center(diamond_size)
  end

  diamond_size.step(3, -2) do |round|
    puts ("*" + " " * (round - 2) + "*").center(diamond_size)
  end

  puts "*".center(diamond_size)
end

diamond(9)
diamond_cover(9)