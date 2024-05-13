# Write a method that returns a list of all substrings of a string that start at
# the beginning of the original string. The return value should be arranged in
# order from shortest to longest substring.

# Examples:

# leading_substrings('abc') == ['a', 'ab', 'abc']
# leading_substrings('a') == ['a']
# leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def leading_substrings(string)
  result = []
  string = string.chars
  1.upto(string.size) do |count|
    result << string.slice(0,count).join
  end
  result
end

# def leading_substrings(string)
#   result = []
#   temp_string = ''

#   string.each_char do |char|
#     temp_string += char
#     result.push(temp_string)
#   end
#   result
# end

# def leading_substrings(string)
#   result = []
#   0.upto(string.size - 1) do |index|
#     result << string[0..index]
#   end
#   result
# end

# def leading_substrings(string) # iterating directly over the characters
#   string.chars.each_index.map { |stop_idx| string[0..stop_idx] }
# end

# def leading_substrings(string) # iterating over a range I
#   (0...string.size).map { |stop_idx| string[0..stop_idx] }
# end

# def leading_substrings(string) # iterating over a range II
#   (1..string.size).map { |length| string[0, length] }
# end

# def leading_substrings(string) # using #times to iterate
#   (string.size).times.map { |stop_idx| string[0..stop_idx] }
# end

# def leading_substrings(string) # using #upto to iterate
#   1.upto(string.size).map { |length| string[0, length] }
# end

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']