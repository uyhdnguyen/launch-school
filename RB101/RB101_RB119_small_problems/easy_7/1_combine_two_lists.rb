 -> RETURN `new_array`# Write a method that combines two Arrays passed in as arguments, and returns
# a new Array that contains all elements from both Array arguments, with the
# elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the
# same number of elements.

# Example:

# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

# def interleave(array_1, array_2)
#   result = []
#   array_1.each_index { |index| result << array_1[index] << array_2[index] }
#   result
# end

# def interleave(array1, array2)
#   result = []
#   array1.each_with_index do |element, index|
#     result << element << array2[index]
#   end
#   result
# end

# def interleave(array_1, array_2)
#   counter = 0
#   result = []

#   while counter < array_1.length
#     result << array_1[counter] << array_2[counter]
#     counter += 1
#   end
#   result
# end

def interleave(array_1, array_2)
  array_1.zip(array_2).flatten
end

p interleave([1, 2, 3], ['a', 'b', 'c'])