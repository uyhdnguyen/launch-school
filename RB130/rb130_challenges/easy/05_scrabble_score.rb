=begin
  PROBLEM
  -------
  - given word
  - program that computs the Scrabble score for given word

  EXAMPLES/ TEST CASES
  --------------------
  - cabbage
  -> 3 + 1 + 3 + 3 + 1 + 2 + 1 = 14

  DATA STRUCTURES
  ---------------
  - INPUT: string
  - OUTPUT: integer

  - INTERMEDIATE:
    - hash that holds the table with key is the score for each letter and array of letters that is value in the hash
    - score variable that is initialize to 0 to keep track of scrabble score

  ALGORITHM
  ---------
  - create class Scrabble
    - create constructor that takes a string as argument
    - create score instance method that calculates scrabble score

  - create required hash constant to hold the scores and letters
    - SCRABBLES = {
    1 : %w(a e i o u l n r s t),
    2 : %w(d g),
    3: %w(b c m p),
    4 : %w(f h v w y),
    5 : %w(k),
    8 : %w(j x),
    10 : %w(q z)
    }

  - create local variable score to keep track of the score and initialize it to 0
    - score = 0

  - find the scrabble score for given word
    - iterate through each char of given word
    - if array of letters in SCRABBLES includes the letter
      - increase the score according to its score
    - return the score

=end
require 'pry'

class Scrabble
  SCRABBLES = {
    1 => %w(a e i o u l n r s t),
    2 => %w(d g),
    3 => %w(b c m p),
    4 => %w(f h v w y),
    5 => %w(k),
    8 => %w(j x),
    10 => %w(q z)
  }

  def initialize(wrd)
    @word = wrd.nil? ? "" : wrd.downcase
  end

  def score
    score = 0
    
    @word.each_char do |chr|
      SCRABBLES.each do |scr, lst|
        score += scr if lst.include? chr
      end
    end

    score
  end

  def self.score(wrd)
    Scrabble.new(wrd).score
  end
end

require 'minitest/autorun'
# require_relative 'scrabble_score'
require 'minitest/reporters'
Minitest::Reporters.use!

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    # skip
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    # skip
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    # skip
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    # skip
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    # skip
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    # skip
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    # skip
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    # skip
    assert_equal 13, Scrabble.score('alacrity')
  end
end