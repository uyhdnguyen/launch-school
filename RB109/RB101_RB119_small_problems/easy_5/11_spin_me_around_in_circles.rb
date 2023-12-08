# You are given a method named spin_me that takes a string as an argument and
# returns a string that contains the same words, but with each word's characters
# reversed. Given the method's implementation, will the returned string be the
# same object as the one passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# The method will return a different object

# On line 7, we convert the string into a new array using method `split`. This
# method returns a new array which make it impossible for us to get back to
# the original string.

# I will get into more details on this `spin_me` method.
# On line 6 ,we define a method named `spin_me` that take a string argument.
# On line 7, we call method `split` on the string `str` which splits the string
# into a new array. On this new array, we call `each` method to iterate through
# each element of the array. On line 8, we call `reverse!` method on each element
# of the new array to revese all character of each element. We then join