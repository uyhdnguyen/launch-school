# Modify the word_sizes method from the previous exercise to exclude non-letters
# when determining word size. For instance, the length of "it's" is 3, not 4.

# Examples

# def word_sizes(string)
#   string = string.delete('^a-zA-Z0-9 ').split(' ')
#   result = Hash.new(0)
#   string.each { |word| result[word.length] += 1}
#   result
# end

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.size] += 1
  end
  counts
end

p word_sizes('Four score and seven.')
p word_sizes('Hey diddle diddle, the cat and the fiddle!')
p word_sizes("What's up doc?")
p word_sizes('')