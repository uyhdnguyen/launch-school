# Write a method that returns true if the string passed as an
# palindrome, false otherwise. A palindrome reads the same forward and backward.
# For this exercise, case matters as does punctuation and spaces.

# Examples:

# def palindrome?(string)
#   string = string.split('')
#   result = []
#   count_right = 0
#   count_left = -1
#   loop do
#     # result <<  string[count_right] == string[count_left] ? true : false
#     if string[count_right] == string[count_left]
#       result << true
#     else
#       result << false
#     end

#     count_right += 1
#     count_left -= 1
#     break if count_right == string.length/2
#   end

#   result.include?(false) ? false : true
# end

# def palindrome?(string)
#   string == string.reverse
# end

# p palindrome?('madam')
# p palindrome?('Madam')        # (case matters)
# p palindrome?("madam i'm adam")
# p palindrome?('356653')

def palindrome2?(obj)
  if obj.class == String
    obj == obj.reverse
  else
    result = obj.reverse
  end
  result == obj
end

p palindrome2?([1,2,3,4,5])

# palindrome2?('123321')