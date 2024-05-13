# Write a method that rotates an array by moving the first element to the end of
# the array. The original array should not be modified.

# Do not use the method Array#rotate or Array#rotate! for your implementation.

# Example:

# rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# rotate_array(x) == [2, 3, 4, 1]   # => true
# x == [1, 2, 3, 4]                 # => true

# def rotate_array(array)
#   result = array.each_index.with_object([]) do |idx, result|
#     result << array[idx] if idx > 0
#   end
#   result << array[0]
# end

def rotate_array(array)
  array[1..-1] + [array[0]]
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true

p rotate_array([7, 3, 5, 2, 9, 1])
p rotate_array(['a', 'b', 'c'])
p rotate_array(['a'])

x = [1, 2, 3, 4]
p rotate_array(x)
p x == [1, 2, 3, 4]

def rotate_string(string)
  rotate_array(string.chars).join
end

p rotate_string('LaunchSchool')

def rotate_integer(integer)
  rotate_string(integer.to_s).to_i
end

p rotate_integer(1988)