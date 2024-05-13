# Write a method that takes two Array arguments in which each Array contains a
# list of numbers, and returns a new Array that contains the product of each pair
# of numbers from the arguments that have the same index. You may assume that
# the arguments contain the same number of elements.

# Examples:

def multiply_all_pairs(array_1, array_2)
  array_1.product(array_2).map { |sub_array| sub_array.reduce(:*) }.sort
end

# def multiply_all_pairs(array_1, array_2)
#   products = []
#   array_1.each do |item_1|
#     array_2.each do |item_2|
#       products << item_1 * item_2
#     end
#   end
#   products.sort
# end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]