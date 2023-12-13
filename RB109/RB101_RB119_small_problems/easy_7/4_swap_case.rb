# Write a method that takes a string as an argument and returns a new string in
# which every uppercase letter is replaced by its lowercase version, and every
# lowercase letter by its uppercase version. All other characters should be
# unchanged.

# You may not use String#swapcase; write your own version of this method.

# Example:

# swapcase('CamelCase') == 'cAMELcASE'
# swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
UPPERCASE_LETTERS = ('A'..'Z').to_a
LOWERCASE_LETTERS = ('a'..'z').to_a

# def swapcase(string)
#   string.split.map do |word|

#     word.chars.map do |char|
#       if UPPERCASE_LETTERS.include?(char)
#         char.downcase!
#       elsif LOWERCASE_LETTERS.include?(char)
#         char.upcase!
#       else
#         char
#       end
#     end.join
#   end.join(' ')
# end

# def swapcase(string)
#   characters = string.chars.map do |char|
#     if char =~ /[a-z]/
#       char.upcase
#     elsif char =~ /[A-Z]/
#       char.downcase
#     else
#       char
#     end
#   end
#   characters.join
# end

def swapcase(string)
  string.chars.map do |char|
    if UPPERCASE_LETTERS.include?(char)
      char.downcase!
    elsif LOWERCASE_LETTERS.include?(char)
      char.upcase!
    else
      char
    end
  end.join
end

p swapcase('CamelCase')
p swapcase('Tonight on XYZ-TV')