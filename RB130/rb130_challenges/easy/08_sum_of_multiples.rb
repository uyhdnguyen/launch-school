=begin
  PROBLEM
  -------
  - given a natural number
  - given a set of one or more other numbers
  - find the sum of all the multiples of the numbers in the st that are less than the first number
  - if set of number is not given, use default set [3,5]
  
  EXAMPLES
  --------
  - Max = 20 : (3, 5)
   3, 5, 6, 9, 10, 12, 15, 18
  -> sum = 78

  - 1 : (3,5)
  -> sum = 0

  - Max = 15 : (4,6)
  -> 4, 6, 8, 12
  -> sum = 30
  
  - Max = 20 : (7,13, 17)
  -> 7, 13, 14, 17
  -> sum = 51

  DATA STRUCTURES
  ---------------
  - INPUT: integer
  - OUTPUT: integer

  - INTERMEDIATE:
    - counter that keeps track of multiples 

  ALGORITHM
  ---------
  - create class SumofMultiples
  - create constructor method that takes integers as an argument
  - create instance method `to` that takes integer as an argumment
    - create local variable to keep track of the sum
      - sum = 0
    - return 0 if given num smaller than 1
    - create a range from 0 up to given number less than 1
      - (1..num - 1)
    - find all multiples from given list
      - iterate through the range and 
        - iterate through the given list 
          - increase the `sum` if number in given list is divisible by number in the range
    - return the sum
=end

class SumOfMultiples
  attr_reader :mul
  def initialize(*mul)
    @mul = (mul.size > 0) ? mul : [3, 5]
  end

  def to(num)
    sum = 0

    (1..num - 1).each do |current_num|
      sum += current_num if any_multiple?(current_num)
    end

    sum
  end

  def any_multiple?(num)
    mul.any? { |mul| num % mul == 0}
  end

  def self.to(num)
    SumOfMultiples.new().to(num)
  end
end

require 'minitest/autorun'
# require_relative 'sum_of_multiples'
require 'minitest/reporters'
Minitest::Reporters.use!

class SumTest < Minitest::Test
  def test_sum_to_1
    # skip
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    # skip
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    # skip
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    # skip
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    # skip
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    # skip
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    # skip
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    # skip
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    # skip
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end