=begin
PROBLEM
-------
write a method that reads in  some text from a text file
input selection of randomized
  nouns
  verbs
  adjectives
  adverbs
method should read the text
for each line
  place random words of the types of word
  output the result

EXAMPLES
--------
The sleepy brown cat noisily
licks the sleepy yellow
dog, who lazily licks his
tail and looks around.

DATA STRUCTURES
---------------
input: long string of text

might need a hash which has type of words as keys and value is an array of words
{
  adjectives: %w(quick lazy sleepy ugly), 
  nouns: %w(fox dog head leg), 
  verbs: %w(jumps lifts bites licks), 
  adverb: %w(easily lazily noisily excitedly)
}

output: long string that represent replaced words

ALGORITHM
---------


=end

words = {
  adjectives: %w(quick lazy sleepy ugly), 
  nouns: %w(fox dog head leg), 
  verbs: %w(jumps lifts bites licks), 
  adverbs: %w(easily lazily noisily excitedly)
}


File.open('madlibs.txt') do |file|
  file.each do |line|
    puts format(line, noun:      words[:nouns].sample,
                      verb:      words[:verbs].sample,
                      adjective: words[:adjectives].sample,
                      adverb:    words[:adverbs].sample)
  end
end

