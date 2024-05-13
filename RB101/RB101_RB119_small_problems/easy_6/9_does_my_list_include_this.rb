# Write a method named include? that takes an Array and a search value as
# arguments. This method should return true if the search value is in the array,
# false if it is not. You may not use the Array#include? method in your solution.

# include?([1,2,3,4,5], 3) == true
# include?([1,2,3,4,5], 6) == false
# include?([], 3) == false
# include?([nil], nil) == true
# include?([], nil) == false

# def include?(array, search_value)
#   search_found = nil
#   counter = 0

#   loop do
#     if array.empty?
#       search_found = false
#       break
#     elsif array[counter] == search_value
#       search_found = true
#       break
#     else
#       search_found = false
#       counter += 1
#       break if counter >= array.length
#     end
#   end
#   search_found
# end

# def include?(array, search_value)
#   !!array.find_index(search_value)
# end

def include?(array, search_value)
  true & array.find_index(search_value)
end

# def include?(array, search_value)
#   array.each do |element|
#     return true if element == search_value
#   end
#   false
# end

def include?(array, search_value)
  array.count(search_value) > 0
end

p include?([1,2,3,4,5], 3)
p include?([1,2,3,4,5], 6)
p include?([], 3)
p include?([nil], nil)
p include?([], nil)