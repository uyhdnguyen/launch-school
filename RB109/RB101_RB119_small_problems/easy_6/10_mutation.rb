# What will the following code print, and why? Don't run the code until
# you have tried to answer.

# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
# puts array2

# Wait a minute! We changed Curly to CURLY, Shemp to SHEMP, and Chico to CHICO
# in array1. How'd those changes end up in array2 as well?

# # The answer lies in the fact that the first each loop simply copies a bunch
# of references from array1 to array2. When that first loop completes, both
# arrays not only contain the same values, they contain the same String objects.
# If you modify one of those Strings, that modification will show up in both
# Arrays.

# # If this answer surprises you, reread the section on Pass by Reference vs
# Pass by Value in Lesson 2 of Programming Foundations. To be successful with
# ruby, you must understand how values are passed around, and what mutation
# means for those values.

# # Further Exploration
# # How can this feature of ruby get you in trouble? How can you avoid it?

# This feature can get me in trouble since it's harder to debug the code later.
# I would not be able to figure out the way to keep track all of the mutated
# values. To avoid this problem we can simply clone the array1 or just make new
# copy and pass them to array2.

# This is how we create a duplicate of an array so they don't get mutated later
# in the program.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1 = array1.dup.map(&:dup) # I have to create duplicate for each element of
                               # the array
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
p array1
p array2
