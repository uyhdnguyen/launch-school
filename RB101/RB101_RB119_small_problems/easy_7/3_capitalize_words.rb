# Write a method that takes a single String argument and returns a new string
# that contains the original value of the argument with the first character of
# every word capitalized and all other letters lowercase.

# You may assume that words are any sequence of non-blank characters.

# Examples

# def word_cap(string)
#   string.split.map(&:capitalize).join(' ')
# end

# def word_cap(string)
#   string.split.map do |word|
#     word[0] = word[0].upcase
#     word
#   end
# end

def word_cap(string)
  string.split.map do |word|

    word.chars.each_with_index do |char, index|
      char[0] = char[0].upcase if index.zero?
    end.join

  end.join(' ')
end

p word_cap('four score and seven')
p word_cap('the javaScript language')
p word_cap('this is a "quoted" word')