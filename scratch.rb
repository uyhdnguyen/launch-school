
# # Write a function that calculates the sum of all numbers in a nested array. The array may contain integers, nested arrays of integers, or a mix of both. (for ruby and JS don’t use flatten) -- Alyssa

=begin
Problem: 
  - input: Array containing Integers, or possibly Array containing Integers
  - output: Integer - representing the sum of all integers within input Array

  - elements within input Array may either be:
    - An Integer
    - An Array containing Integers
    - A nested Array containing Integer
  - CANNOT use `Array#flatten`
Example:
  - test cases have at most two nested Arrays, within the input Array
  - sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
  - sum_of_nested_array([10, [20, 30, [40]], 50]) # 150
Data Structure: 
  - Array and nested Array
Algorithm:
  - create a variable to hold the sum value
  - iterate through the input Array
    - if element being iterated over is an Integer, add value to the sum result variable
    - if element is not an Integer, iterate through subarray
      - if element within subarray is an Integer, add value to the sum result variable
      - if element is not an Integer, iterate through subarray
        - Any remaining element should be an Integer, add value of element to the sum result variable
  - return the sum result variable
Code:
=end

# def sum_of_nested_array(arr)
#   result = 0
#   arr.each do |el|
#     if el.is_a?(Integer)
#       result += el
#     else
#       el.each do |el2|
#         if el2.is_a?(Integer)
#           result += el2
#         else
#           el2.each do |el3|
#             result += el3
#           end
#         end
#       end
#     end
#   end
#   result
# end

# def sum_of_nested_array(arr)
#   stack = arr.dup
#   total = 0

#   until stack.empty?
#     current = stack.pop

#     if current.is_a?(Array)
#       stack.concat(current)
#     else
#       total += current
#     end
#   end

#   total
# end

# # # Test cases
# puts sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
# puts sum_of_nested_array([10, [20, 30, [40]], 50]) # 150


#################################################################
=begin
Write a function that calculates the sum of all numbers in a nested array. The array may contain integers, nested arrays of integers, or a mix of both. (for ruby and JS don’t use flatten)

sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
sum_of_nested_array([10, [20, 30, [40]], 50]) # 150

- PROBLEM
  - Input: array of mixed elements
  - Output: integer that is a sum of all of elements in the array

  - Rules:
    - calculate the sum of all numbers
    - input may contain
      - integers
      - nested arrays of integerse
      - mix
    - dont use flatten method

- EXAMPLE
  -[1, [2, 3], [4, [5, 6]]] - > 21

- DATA STRUCTURE
  - array 

- ALGORITHM
  - create a placeholder for  all elements
  - find if there is nested arrays inside given array
    - iterate through the given array to check which element is an array
      - if element is not an array, append element to the placeholder
      - else, redo step 2
  - return the sum

=end

def sum_of_nested_array(array)
  # stack = array.dup
  # sum = 0
  # until stack.empty?
  #   current_element = stack.pop

  #   if current_element.is_a?(Integer)
  #     sum += current_element
  #   else
  #     stack.concat(current_element)
  #   end
  # end

  # sum

  
end

p sum_of_nested_array([1, [2, 3], [4, [5, 6]]])

def sum_of_nested_array(array)
  result = []
  flatten_array = []
  
  (array.length - 1).times do |x|

    if array[x].is_a?(Integer)
      result << array[x]
    else
      flag = true
      flatten_array += array[x]

      loop do
        flag = false
        
        if flatten_array.all?(Integer)
          result += flatten_array
        else
          flatten_array.each do |el|
            if el.is_a?(Integer)
              result += flatten_array.delete(el)
            else
              
          end
        end
        break if flag == false
      end
    end
  end
end


# sum_of_nested_array([1, [2, 3], [4, [5, 6]]]) # 21
# sum_of_nested_array([10, [20, 30, [40]], 50]) # 150


# require 'pry'

# def bubble_sort(array)
#   return array if array.size <= 1
#   swap = true
#     loop do
#       swap = false
#       (array.length - 1).times do |x|
#         if array[x] > array[x+1]
#           array[x], array[x+1] = array[x+1], array[x]
#           swap = true
#         end
#       end
#       break if swap == false
#     end
#   array
# end

# p bubble_sort([3,3,6,1,4,7,5])


