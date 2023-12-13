# Write a method that returns an Array that contains every other element of an
# Array that is passed in as an argument. The values in the returned list should
# be those values that are in the 1st, 3rd, 5th, and so on elements of the
# argument Array.

# Examples:

# oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# oddities(['abc', 'def']) == ['abc']
# oddities([123]) == [123]
# oddities([]) == []
# oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end

# initial solution
def oddities(array)
  array.each_index.with_object([]) do |idx, result|
    result << array[idx] if idx.even?
  end
end

# some other solutions
def oddities(array)
  array.map.with_index { |ele, idx| ele if idx.even? }.compact
end

def oddities(array)
  (0...array.size).map { |idx| array[idx] if idx.even? }.compact
end

def oddities(array)
  (0...array.size).step(2).map { |idx| array[idx] }
end

def oddities(array)
  0.step(array.size - 1, 2).map { |idx| array[idx] }
end

p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities(['abc', 'def']) == ['abc']
p oddities([123]) == [123]
p oddities([]) == []
p oddities([1, 2, 3, 4, 1]) == [1, 3, 1]