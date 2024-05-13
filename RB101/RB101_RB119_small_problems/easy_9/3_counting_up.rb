# Write a method that takes an integer argument, and returns an Array of all
# integers, in sequence, between 1 and the argument.

# You may assume that the argument will always be a valid integer that is
# greater than 0.

# Examples:

# sequence(5) == [1, 2, 3, 4, 5]
# sequence(3) == [1, 2, 3]
# sequence(1) == [1]

# def sequence(number)
#   result = []
#   1.upto(number) { |index| result << index }
#   result
# end

def sequence(number)
  if number.positive?
    (1..number).to_a
  else
    (number..1).to_a.reverse
  end
end


p sequence(-5)
p sequence(3)
p sequence(1)
