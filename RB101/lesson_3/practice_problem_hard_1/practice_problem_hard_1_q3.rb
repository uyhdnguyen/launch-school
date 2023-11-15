# In other practice problems, we have looked at how the scope of variables 
# affects the modification of one "layer" when they are passed to another.

# To drive home the salient aspects of variable scope and modification of 
# one scope by another, consider the following similar sets of code.

# What will be printed by each of these code groups?

# A
def mess_with_vars(one, two, three)
  one = 'one'
  p "in method #{one.object_id}"
  two = 'two'
   p "in method #{two.object_id}"
  three = 'three'
    p "in method #{three.object_id}"
end

one = "one"
two = "two"
three = "three"
p "in the beginning #{one.object_id}"
p "in the beginning #{two.object_id}"
p "in the beginning #{three.object_id}"

mess_with_vars(one, two, three)

puts "after one is: #{one.object_id}"
puts "after two is: #{two.object_id}"
puts "after three is: #{three.object_id}"

# "one is: one"
# "two is: two"
# "three is: three"

# "one is: one"
# "two is: two"
# "three is: three"

# "one is: two"
# "two is: three"
# "three is: one"