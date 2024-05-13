# Write a method that returns the next to last word in the String passed to it
# as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least two words.

# Examples:

# penultimate('last word') == 'last'
# penultimate('Launch School is great!') == 'is'

# def penultimate(string)
#   string = string.split
#   string[-2]
# end

def penultimate(string)
  new_string = string.split
  if new_string.size <= 1
    string
  elsif new_string.size.even?
    new_string.slice((new_string.size / 2) -1, 2).join(' ')
  else
    new_string.slice((new_string.size / 2) , 1).join(' ')
  end
end

p penultimate('last word')
p penultimate('Launch School is great!')
p penultimate('')
p penultimate('great!')
p penultimate('LS is great!')