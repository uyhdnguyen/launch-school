# Write a method that takes a first name, a space, and a last name passed as a
# single String argument, and returns a string that contains the last name, a
# comma, a space, and the first name.

# Examples

# swap_name('Joe Roberts') == 'Roberts, Joe'

# def swap_name(string)
#   string = string.split.reverse
#   string[0].concat(',')
#   string.join(' ')
# end

def swap_name(string)
  string = string.split.reverse.join(", ")
end
p swap_name('Joe Roberts') == 'Roberts, Joe'