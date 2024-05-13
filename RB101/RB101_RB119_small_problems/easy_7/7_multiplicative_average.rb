# Write a method that takes an Array of integers as input, multiplies all the
# numbers together, divides the result by the number of entries in the Array,
# and then prints the result rounded to 3 decimal places. Assume the array is
# non-empty.

# Examples:

# show_multiplicative_average([3, 5])                # => The result is 7.500
# show_multiplicative_average([6])                   # => The result is 6.000
# show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

# def show_multiplicative_average(array)
#   product = array.reduce(1.to_f) { |product, element| product *= element}
#   average = product / array.size
#   puts "The result is #{format('%.3f', average)}"
# end

def show_multiplicative_average(array)
  average = array.reduce(:*).fdiv(array.size)
  puts "The result is #{sprintf('%.3f', average)}"
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667