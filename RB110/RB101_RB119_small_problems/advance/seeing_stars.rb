=begin

PROBLEM
-------
- write a method that display 8-pointed star
- n x n grid
- n is odd integer passed in as argument
- smallest input is 7
  - 7 x 7 grid
- every line is only has 3 stars
-

EXAMPLES
--------
star(7)

*  *  * # (n - 1)/ 2 times | size is n | space * 0 + star + space * (n - 3)/2  + star + space * (n - 3)/2 + star + space * 0
 * * *                     | size is n | space * 1 + star + space * (n - 3)/2  + star + space * (n - 3)/2 + star + space * 1
  ***
*******
  ***
 * * *
*  *  *

DATA STRUCTURES
---------------

ALGORITHM
---------
- create middle line which is the length of the grid
- repeat (n - 1)/ 2
  - create upper part
- repeat (n - 1)/ 2
  -create lower part

=end
# SPACE = ' '
# STAR = '*'

# def star(n)
#   ((n-1)/2 - 1).downto(0) do |space_index|
#     puts (STAR + SPACE * space_index + STAR + SPACE * space_index + STAR).center(n)
#   end

#   puts STAR * n

#   0.upto((n-1)/2 - 1) do |space_index|
#     puts (STAR + SPACE * space_index + STAR + SPACE * space_index + STAR).center(n)
#   end

# end

# puts "

# "

# star(7)

# puts "

# "

# star(9)