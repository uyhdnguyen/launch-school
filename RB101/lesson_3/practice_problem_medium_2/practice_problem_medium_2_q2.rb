# Let's take a look at another example with a small difference in the code:

a = 42
b = 42
c = a

puts a.object_id
puts b.object_id
puts c.object_id

# In Ruby, integers are immutable. Hence, a,c and c would have
# the same object_id