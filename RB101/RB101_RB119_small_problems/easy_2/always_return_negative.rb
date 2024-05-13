# Write a method that takes a number as an argument. If the argument is a
# positive number, return the negative of that number. If the number is 0 or
# negative, return the original number.

def negative(num)
  num > 0 ? - num : num
end

def negative_2(num)
  -num.abs
end

p negative(5)
p negative(-3)
p negative(0)     # There's no such thing as -0 in ruby

p negative_2(5)
p negative_2(-3)
p negative_2(0)
