# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each pair
# of numbers from the arguments that have the same index. You may assume that the
# arguments contain the same number of elements.

# Examples:

# multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

# def multiply_list(array_1, array_2)
#   result = []
#   array_1.each_with_index do |element, index|
#     result << element * array_2[index]
#   end
#   result
# end

# def multiply_list(array_1, array_2)
#   result = []
#   counter = 0
#   while counter < array_1.length
#     result << array_1[counter] * array_2[counter]
#     counter += 1
#   end
#   result
# end

# def multiply_list(array_1, array_2)
#   array_1.zip(array_2).each_with_object([]){ |element, array| array << element.reduce(:*)}
# end

def multiply_list(array_1, array_2)
  array_1.zip(array_2).map { |sub_array| sub_array.inject(:*) }
end

p multiply_list([3, 5, 7], [9, 10, 11])
