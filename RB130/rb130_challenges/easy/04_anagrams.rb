=begin
  PROBLEM
  -------
  - program that takes 
    - a word
    - a list of possible anagrams
  - select correct sublist that contains the anagrams of the word
  - anagram is a word formed by rearranging the letter of a different word
  - case insensity when compare the words
  - return the list of anagrams keeping the result case sensitive
  - program should have a constructor that take keyword
  - program should have an instance method that take list of words, that's called 'detector'

  EXAMPLES
  --------
  Orchestra
  %w(cashregister Carthorse radishes)
  -> [Carthorse]

  allergy
  %w( gallery ballerina regally clergy largely leading)
  -> %w(gallery largely regally)

  DATA STRUCTURES
  ---------------
  - INPUT: string and array of strings
  - OUTPUT: array of strings

  - INTERMEDIATE:
    - array to keep track of the result

  ALGORITHM
  ---------
  - create a class
    - Anagram
  - create constructor method that takes a string as argument
    - def initialize(word)
  - create an instance method that takes an array of string as argument
    - def match(words)
    - create an array to keep track of the result
      - res = []
    - find the anagrams of given word
      - iterate through array of words
        - words.each_with_object([])
      - transfrom word in given array to downcase and to array
      - transform given word into downcase and to array
      - compare these transformed array
        - if they are the same, push the original word to `res`
    - return rest
  
=end

class Anagram
  def initialize(wrd)
    @wrd = wrd
  end

  def match(wrds)
    wrds.each_with_object([]) do |wrd, res|
      next if @wrd.downcase == wrd.downcase

      res << wrd if wrd.downcase.chars.sort == @wrd.downcase.chars.sort
    end
  end
end

# class Anagram
#   attr_reader :word

#   def initialize(word)
#     @word = word.downcase
#   end

#   def match(word_array)
#     word_array.select do |ana|
#       ana.downcase != word && anagram?(ana, word)
#     end
#   end

#   private

#   def sorted_letters(str)
#     str.downcase.chars.sort.join
#   end

#   def anagram?(word1, word2)
#     sorted_letters(word1) == sorted_letters(word2)
#   end
# end

require 'minitest/autorun'
require 'minitest/reporters'
# require_relative 'anagram'
Minitest::Reporters.use!

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants))
  end

  def test_detect_simple_anagram
    # skip
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams
  end

  def test_detect_multiple_anagrams
    # skip
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
  end

  def test_does_not_confuse_different_duplicates
    # skip
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle'])
  end

  def test_identical_word_is_not_anagram
    # skip
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
    # skip
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last'])
  end

  def test_eliminate_anagram_subsets
    # skip
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))
  end

  def test_detect_anagram
    # skip
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana)
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
    # skip
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort
  end

  def test_anagrams_are_case_insensitive
    # skip
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams
  end
end