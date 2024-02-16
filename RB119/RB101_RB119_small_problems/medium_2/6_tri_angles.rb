=begin
PROBLEM
=======
- right: one angle of a triangle is a right angle (90*)
- acute: all 3 angles are less than 90*
- obtuse: one angle is greater than 90*
- sum of angles == 180*
- all angles > 0
- 3 angles as arguments
- return symbols
  - :right
  - :acute
  - :obtuse
  - :invalid
- all angles are integers
- all mesasure in degrees

EXAMPLE
=======
triangle(60, 70, 50) == :acute -> all angles < 90
triangle(30, 90, 60) == :right -> one angle == 90
triangle(120, 50, 10) == :obtuse -> one angle > 90
triangle(0, 90, 90) == :invalid 
-> sum of angles == 180* && - all angles > 0

DATA STRUCTURE
==============
- input: integers that represent angles
- output: symbols that represent type of triangles or invalid
- process: might need an array to hold all of the angles?

ALGORITHM
=========
- create the placeholder to hold the sum of all angles
- create invalid condition
  - return :invalid
- create an array to hold all of the angles
- return symbols based on conditions

=end

def triangle(a, b, c)
  angles = [a, b, c]

  return :invalid unless angles.reduce(:+) == 180 && angles.reduce(:*)  > 0

  case
  when angles.all?{|angle| angle < 90}
    :acute
  when angles.any?(90)
    :right
  else
    :obtuse 
  end
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid