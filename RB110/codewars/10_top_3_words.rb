=begin
Write a function that, given a string of text (possibly with punctuation and line-breaks), returns an array of the top-3 most occurring words, in descending order of the number of occurrences.

Assumptions:
A word is a string of letters (A to Z) optionally containing one or more apostrophes (') in ASCII.
Apostrophes can appear at the start, middle or end of a word ('abc, abc', 'abc', ab'c are all valid)
Any other characters (e.g. #, \, / , . ...) are not part of a word and should be treated as whitespace.
Matches should be case-insensitive, and the words in the result should be lowercased.
Ties may be broken arbitrarily.
If a text contains fewer than three unique words, then either the top-2 or top-1 words should be returned, or an empty array if a text contains no words.
Examples:
"In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

--> ["a", "of", "on"]


"e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"

--> ["e", "ddd", "aa"]


"  //wont won't won't"

--> ["won't", "wont"]
Bonus points (not really, but just for fun):
Avoid creating an array whose memory footprint is roughly as big as the input text.
Avoid sorting the entire array of unique words.

PROBLEM
-------
- input: string of textx
- output: array contains 3 elements (lowercase)

- find t most occurring words, in descending order of the number of occurrences.
- case insensitive
- return array can be less than 3 elements

EXAMPLES
--------
"e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"

--> ["e", "ddd", "aa"]

DATA STRUCTURES
---------------
- array contains all of the words from text
- hash contains the counts for words
  - words as keys
  - counts as values

ALGORITHM
---------
- create a hash contains the counts for words
    - `words_counts`
- transform given text to downcase
  - `downcase``
- transform  given text into array of words
  - `split` the text by removing spaces
- transform the array to unique words
  - `uniq`, `uniq_words`
- find and return counts for each word in `uniq_words` for `words_counts`
  - iterate through each word in `uniq_words`
    - `each`
  - `count` method and return to words_counts
- sort `words_counts` in descending order
- return the first 3 elements

=end

# def clean_texts(str)
#   str = str.downcase

#   dictionary = ("a".."z").to_a + ["'"]

#   clean_text = ""

#   str.each_char do |chr|
#     if dictionary.include?(chr)
#       clean_text << chr
#     else
#       clean_text << " "
#     end
#   end

#   clean_text
# end

# def top_3_words(str)
#   words_counts = {}

#   str = clean_texts(str).split(" ")

 
#   uniq_words = str.uniq

#   return [] if uniq_words == ["'"] || uniq_words == ["'''"] 

#   uniq_words.each do |word|
#     words_counts[word] = str.count(word)
#   end

#   words_counts.sort_by {|w, c| -c}.first(3).map(&:first)
# end

def top_3_words(text)
  text.scan(/[A-Za-z']+/)
      .select { |word| /[A-Za-z]+/ =~ word }
      .group_by { |x| x.downcase }
      .sort_by { |k,v| -v.count }
      .first(3)
      .map(&:first)
end

p top_3_words "e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e"

p top_3_words "In a village of La Mancha, the name of which I have no desire to call to
mind, there lived not long since one of those gentlemen that keep a lance
in the lance-rack, an old buckler, a lean hack, and a greyhound for
coursing. An olla of rather more beef than mutton, a salad on most
nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
on Sundays, made away with three-quarters of his income."

p top_3_words "  //wont won't won't"

p top_3_words ("  , e   .. ")


p top_3_words "  '  "
p top_3_words "  '''  "
# str =  "In a village of La Mancha, the name of which I have no desire to call to
# mind, there lived not long since one of those gentlemen that keep a lance
# in the lance-rack, an old buckler, a lean hack, and a greyhound for
# coursing. An olla of rather more beef than mutton, a salad on most
# nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
# on Sundays, made away with three-quarters of his income.   , e   .. "

# p str.gsub(/\W/, " ").split(" ")