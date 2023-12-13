# Write a method that takes a string, and returns a new string in which every
# character is doubled.

# Examples:

# repeater('Hello') == "HHeelllloo"
# repeater("Good job!") == "GGoooodd  jjoobb!!"
# repeater('') == ''

def repeater(string)
  string.chars.map { |char| char * 2}.join
end

# def repeater(string)
#   result = ''
#   string.each_char do |char|
#     result << char << char
#   end
#   result
# end

# initial solution
def repeater(string)
  string.chars.map { |char| char * 2 }.join
end

# with #inject instead of #map
def repeater(string)
  string.chars.inject("") {|new_string, char| new_string << char * 2 }
end

# which in this instance is basically the same as using #with_object, except the block takes the variables in a different order
def repeater(string)
  string.each_char.with_object("") { |char, new_string| new_string << char * 2 }
end

# with #zip (while playing around I realized that #flatten isn't required, as #join automatically handles nested arrays
def repeater(string)
  string.chars.zip(string.chars).join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''