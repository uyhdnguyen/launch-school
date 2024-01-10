# # What is output when we run this code? What does this demonstrate?

# def hello
#   puts 'Hello!'
# end

# if hello
#   puts 'Nice to meet you!'
# else
#   puts 'Fine, be that way.'
# end



# #####

# What is output by this code? What concept is being demonstrated?

# adjective = 'Delicious'

# my_favorite_foods = ['cheese', 'avocado', 'olives']

# my_favorite_foods.each do |food|
#   if food == 'avocado'
#     puts "I love #{food}, it's #{adjective.upcase!}!!!"
#   else
#     puts "I love #{food}, it's #{adjective}!"
#   end
# end


# #####

# # What is output by this code? How many `mushroom` variables are there in this code?

# mushroom = 'Red'

# def grow(mushroom)
#   puts "You doubled in size with the #{mushroom} mushroom!"

#   mushroom = nil
# end

# grow(mushroom)

# def mess_with_vars(one, two, three)
#   p one
#   one = two # one = "one"

#   p one
#   two = three
#   # p two
#   three = one
#   # p three
# end

# one = "one"
# two = "two"
# three = "three"

# mess_with_vars(one, two, three)
# require 'pry'

# def remove_evens!(arr)
#   arr.each do |num|
#     if num % 2 == 0
#       arr.delete(num)
#       binding.pry
#     end
#   end
#   arr
# end

# def remove_evens!(arr)
#   arr.select { |num| num % 2 == 0}.each { |num| arr.delete(num) }

#   arr
# end

# p remove_evens!([1,1,2,3,4,6,8,9])

# { a: "ant", b: "bear", c: "cat" }.each.with_index do |(k,v), index|
#   puts "The index is #{index}, key is  #{k} and value is #{v}"
# end

# def has_value?(hash, str)
#   hash.each_value do |value|
#       return true if value == str
#   end

#   false
# end

# p has_value?({ a: "ant", b: "bear", c: "cat" } , 'beart')

# def someMethod(array)
#   array.map { |n| yield(n) }  # Invoking the block using yield
# end

# p someMethod([1, 3, 5]) { |n| n**2 }

# array = [1, 2, [3, 4], [], { :alphabet => ['abcde', 'fg'] }, 'h']

# p array[4][:alphabet][1][1]

# arr = [["Mike",99], ["Zoolander",99],["Todd",230],["Max",99], ["Abby",13],["Mildred",99] ]
# p arr.sort_by { |name, score| [-score, -name] }


HORIZONTAL_TEXT = "+--+"
VERTICAL_TEXT = "|"

LOREM_IPSUM = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."

# the 1500s, when an unknown printer took a galley of type and scrambled it to
# make a type specimen book. It has survived not only five centuries, but also
# the leap into electronic typesetting, remaining essentially unchanged. It was
# popularised in the 1960s with the release of Letraset sheets containing Lorem
# Ipsum passages, and more recently with desktop publishing software like Aldus
# PageMaker including versions of Lorem Ipsum."

MAX_TEXT_LENGTH = 76


def print_in_box_3(string)
  result = []
string.chars.each_slice(76) { |word| result << word.join }
p result
end
print_in_box_3(LOREM_IPSUM)