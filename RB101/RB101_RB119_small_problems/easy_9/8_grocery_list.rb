# Write a method which takes a grocery list (array) of fruits with quantities
# and converts it into an array of the correct number of each fruit.

# Example:

# buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]

# def buy_fruit(array)
#   list = array.to_h
#   result = []
#   list.each do |k, v|
#     v.times { result << k }
#   end
#   result
# end

# def buy_fruit(array)
#   array.map { |fruit, quantity| [fruit] * quantity }.flatten
# end

# def buy_fruit(array)
#   expanded_list = []

#   array.each do |sub_array|
#     fruit,quantity = sub_array[0], sub_array[1]

#     quantity.times { expanded_list << fruit }
#   end

#   expanded_list
# end

def buy_fruit(array)
  expanded_list = []

  array.each do |fruit, quantity|
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
#   ["apples", "apples", "apples", "orange", "bananas","bananas"]