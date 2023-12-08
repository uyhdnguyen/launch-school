# Given an unordered array and the information that exactly one value in the
# array occurs twice (every other value occurs exactly once), how would you
# determine which value occurs twice? Write a method that will find and return
# the duplicate value that is known to be in the array.

# Examples:

# find_dup([1, 5, 3, 1]) == 1
# find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

# def find_dup(array)
#   # Create a new hash which counts every element's occurence
#   result = Hash.new(0)
#   new_result = {}

#   # Iterate through given array and push array's values as key
#   array.each { |el| result[el] += 1}

#   # Remove all non duplicated keys
#   result.each_pair { |k,v| new_result[k] = v if v >= 2 }

#   # Count the size of the hash
#   new_result.key(2)
# end

# def find_dup(array)
#   array.find { |el| array.count(el) == 2 }
# end

# def find_dup(array)
#   checked_elements = []
#   counter = 0
#   loop do
#     checked_elements << array[counter] unless checked_elements.include?(array[counter])
#     counter += 1
#     break if checked_elements.include?(array[counter])
#   end
#   array[counter]
# end

# def find_dup(array)
#   array.each do |element|
#     return element if array.count(element) == 2
#   end
# end

def find_dup(array)
  array.tally.key(2)
end

p find_dup([1, 5, 3, 1])

p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58])