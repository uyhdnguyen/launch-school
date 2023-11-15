# To drive that last one home...let's turn the tables and have the string show 
# a modified output, while the array thwarts the method's efforts to modify 
# the user's version of it.

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# My string looks like this now: pumpkinsrutabaga
# My array looks like this now: ["pumpkins"]

# The String#+= operation is re-assignment and creates a new String object. 
# The reference to this new object is assigned to string_param_one. The local 
# variable string_param_one now points to "pumpkinsrutabaga", not "pumpkins".
# It has been re-assigned by the String#+= operation. 
# This means that string_param_one and string_arg_one no longer point to 
# the same object.

# On the other hand, String#<< mutates the calling object.
# Therefore, string_param_two << "rutabaga" mutates the object referenced
# by string_param_two, so that it becomes "pumpkinsrutabuga". 
# So, because the local variable string_param_two still points to 
# the original object, the local variables string_arg_two and 
# string_param_two are still pointing at the same object, and we see
# the results of what happened to the array "outside" of the method.