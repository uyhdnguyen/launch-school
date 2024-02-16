=begin

- PROBLEM
  - Input: lengths of 3 sides, all integers
  - Output: return symbol :quilateral, :isosceles, :scalene or :invalid

  - Rules:
    - equilateral has a = b = c
    - isosceles has a = b, a # c and b # c
    - scalene has a # b,c and b # a,c and c # a,b
    - valid triangle : shortest side + shortest side > longest side && all > 0

- EXAMPLE
  - triangle(0, 3, 3)  == :invalid -> 0 + 3 == 3 still invalid if equal 3
  - triangle(3, 3, 3) == :equilateral -> 3 == 3 == 3
  - triangle(3, 3, 1.5) == :isosceles -> 3 == 3
  - triangle(3, 4, 5) == :scalene -> 3 != 4 != 5

- DATA STRUCTURE
  - array to hold all of the symbols
  - array to hold all of the sides

- ALGORITHM
  - CREATE an array of 3 sides
  - SORT the array from smallest to largest
  - RETURN :invalid sum of 2 smallest sizes <= largest side
  - RETURN :equilateral if they are all equal
  - RETURN :scalene if they are all unique
  - RETURN :isosceles if 2 sides are equal and different from the other side

=end

def triangle(a, b, c)
  sides = [a, b, c].sort

  if sides[0] + sides[1] <= sides[2]
    :invalid
  elsif sides.uniq.size == 1
    :equilateral
  elsif sides.uniq.size == 3
    :scalene
  else
    :isosceles
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid