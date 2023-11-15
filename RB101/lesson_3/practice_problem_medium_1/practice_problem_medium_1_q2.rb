# The result of the following statement will be an error:

#puts "the value of 40 + 2 is " + (40 + 2)

# There would be an error since integers cannot concatenate with strings

# Convert this to string
puts "the value of 40 + 2 is " + (40 + 2).to_s

puts "the value of 40 + 2 is #{40 + 2}"