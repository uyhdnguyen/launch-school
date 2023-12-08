# In the previous exercise, you developed a method that converts non-negative
# numbers to strings. In this exercise, you're going to extend that method by
# adding the ability to represent negative numbers as well.

# Write a method that takes an integer, and converts it to a string
# representation.

# You may not use any of the standard conversion methods available in Ruby,
# such as Integer#to_s, String(), Kernel#format, etc. You may, however, use
# integer_to_string from the previous exercise.

# Examples

CHARACTERS = {
  0 => '0', 1 => '1',  2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

DIGITS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']

def integer_to_string(number)
  if number > 0
    sign = '+'
    characters = number.digits.reverse.map { |num| CHARACTERS[num] }
    sign << characters.join
  elsif number < 0
    sign = '-'
    number = -number
    characters = number.digits.reverse.map { |num| CHARACTERS[num] }
    sign << characters.join
  else
    characters = number.digits.reverse.map { |num| CHARACTERS[num] }
    characters.join
  end
end

p integer_to_string(4321)
p integer_to_string(0)
p integer_to_string(-123)
