=begin

Write a program that reads the content of a text file and then prints the longest sentence in the file based on number of words. Sentences may end with periods (.), exclamation points (!), or question marks (?). Any sequence of characters that are not spaces or sentence-ending characters should be treated as a word. You should also print the number of words in the longest sentence.

Example text:

- PROBLEM
  - Input: string that contains the text file
  - Output: string that is longest sentence and the size of that sentence 

  - Rules:
    - Explicit:
      - print the longest sentence in the file based on number of words
      - sentence is end with (. ! ?)
      - sequence of characters that not spaces or (.!?) is a word
        "--" is a word
      - print the number of words 
    - Implicit:
      - (,) attachs to a word is consider a word
      - ending paragraph is treated as ending sentence

- EXAMPLES AND TEST CASES
  - 

- DATA STRUCTURE
  - Input: 
  - Output: 
  - Array? Hash? Combination?

- ALGORITHM
  - (convert the given string into an array_of_sentences)
    - sentences = text.split(/\.|\?|!/)
  - create longest_entence_size and longest_sentence_index
  - iterate through array_of_sentences
    - get the size of the sentence
      - compare the size to the longest_sentence_size
        - if it's greater 
          - reassign longest_sentence_size to new size
          - reassign longest_sentence_index to new index
        - else skip to the next iteration
  return longest_sentence_size and longest_sentence_index

=end

# def detect_longest_sentence(text)
#   array_of_sentences = text.split(/\.|\?|!/)

#   result = {}
#   array_of_sentences.each_with_index do |sentence, index|
#     result[sentence.split.count] = sentence
#   end

#   longest_sentence_count = result.keys.max
#   longest_sentence = result[longest_sentence_count]
  
#   <<-TEXT
#   The longest sentence in the given text is :

#   #{longest_sentence}

#   It is #{longest_sentence_count } words long
#   TEXT
  
# end

# def detect_longest_sentence(text)
#   array_of_sentences = text.split(/\.|\?|!/)

#   array_of_sentences.sort_by! {|sentence| sentence.split.count}

#   longest_sentence = array_of_sentences.last
#   longest_sentence_count = array_of_sentences.last.split.count

#   <<-TEXT
#     The longest sentence in the given text is :
  
#     #{longest_sentence}
  
#     It is #{longest_sentence_count} words long
#   TEXT
  
# end

def detect_longest_sentence(text)
  longest_sentence = text.split(/\.|\?|!/).max_by {|sentence| sentence.split.count}

  longest_sentence_count = longest_sentence.split.count

  <<-TEXT
    The longest sentence in the given text is :
  
    #{longest_sentence}
  
    It is #{longest_sentence_count} words long
  TEXT
end
 
puts detect_longest_sentence('Four score and seven years ago our fathers brought forth
on this continent a new nation, conceived in liberty, and
dedicated to the proposition that all men are created
equal.

Now we are engaged in a great civil war, testing whether
that nation, or any nation so conceived and so dedicated,
can long endure. We are met on a great battlefield of that
war. We have come to dedicate a portion of that field, as
a final resting place for those who here gave their lives
that that nation might live. It is altogether fitting and
proper that we should do this.

But, in a larger sense, we can not dedicate, we can not
consecrate, we can not hallow this ground. The brave
men, living and dead, who struggled here, have
consecrated it, far above our poor power to add or
detract. The world will little note, nor long remember
what we say here, but it can never forget what they
did here. It is for us the living, rather, to be dedicated
here to the unfinished work which they who fought
here have thus far so nobly advanced. It is rather for
us to be here dedicated to the great task remaining
before us -- that from these honored dead we take
increased devotion to that cause for which they gave
the last full measure of devotion -- that we here highly
resolve that these dead shall not have died in vain
-- that this nation, under God, shall have a new birth
of freedom -- and that government of the people, by
the people, for the people, shall not perish from the
earth.')