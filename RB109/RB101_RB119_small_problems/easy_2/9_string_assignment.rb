# Take a look at the following code:

# name = 'Bob'
# save_name = name
# name = 'Alice'
# puts name, save_name

# What does this code print out? Think about it for a moment before continuing.

# If you said that code printed

# Alice
# Bob

# you are 100% correct, and the answer should come as no surprise. Now, let's look at something a bit different:

# name = 'Bob'
# save_name = name
# name.upcase!
# puts name, save_name

# What does this print out? Can you explain these results?

# Local variable `name` is assigned to string `'Bob'`. Local variable `save_name`
# is also assigned to the same string `'Bob'` as `name`. On line 3, the destruction
# method  `upcase!` was called on object `name` which mutated the string `'Bob'` to
# `'BOB'`. One line 4, the `puts` method was invoked and passed in local variable
# `name` ans `save_name`. These two variables are referenced by the same mutated
# string `'BOB'`. Thus, the output would be  `'BOB'