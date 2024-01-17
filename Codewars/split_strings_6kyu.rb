=begin
Complete the solution so that it splits the string into pairs of two characters.
If the string contains an odd number of characters then it should replace the
missing second character of the final pair with an underscore ('_').
=end

# def solution(str)
#   str << '_' if str.size.odd?

#   result = []

#   str.chars.each.with_index do |ele, index|
#     result << str.slice(index, 2) if index.even?
#   end

#   result
# end


def solution(str)
  str << '_' if str.size.odd?

  str.chars.each_slice(2).map(&:join)

  # str.chars.each_slice(2) {|tuple| result << tuple.join}

end

p solution 'abc'
p solution 'abcdef'
p solution("abcdefg")