=begin
 PROBLEM
 -------
 - convert octal to decimal
 - given octal input string
 - produce decimal output
 - invalid input are treated as octal 0
 - What's octal?
  - Decimal is base-10 system
  - Number 233 in base 10 notation is linear combination of powers of 10

  EXAMPLES/ TEST CASES
  - 233 (DECIMAL)
    -> 2 * 10^2 + 3 * 10^1 + 3 * 10^0
    -> 2 * 100  + 3 * 10   + 3 * 1

  - 233 (OCTAL)
    -> 2 * 8^2 + 3 * 8^1 + 3 * 8^0
    -> 2 * 64  + 3 * 8   + 3 * 1
    -> 155

  DATA STRUCTURES
  ---------------
  - INPUT: string that represent a number
  - OUTPUT: integer

  - INTERMEDIATE:
    - convert string into integer

  ALGORITHM
  ---------
  - create a class Octal
  - create a constructor method that take a string as argument
  - create an instance method called `to_decimal`
    - create `octal` local variable that keeps track of octal number
      - octal = 0
    - transform given string into array of integers
      - digits = num.digits
    - find all octal form for each digit in digits
      - iterate through each digit in digits
        - digits.each_with_index do |dgt, idx|
        - return the octal for current digit
          - dgt * 8 ** idx
        - return the sum of octal
          - octal += dgt * 8** idx
    - return octal
=end

class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 unless valid_octal?(num)

    octal = 0

    digits = num.to_i.digits

    digits.each_with_index do |dgt, exp|
      octal += dgt * (8 ** exp)
    end

    octal
  end

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end

require 'minitest/autorun'
# require_relative 'octal'
require 'minitest/reporters'
Minitest::Reporters.use!

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    # skip
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    # skip
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    # skip
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
    # skip
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
    # skip
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
    # skip
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
    # skip
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    # skip
    assert_equal 0, Octal.new('carrot').to_decimal
  end

  def test_8_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('8').to_decimal
  end

  def test_9_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('9').to_decimal
  end

  def test_6789_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('abc1z').to_decimal
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
    # skip
    assert_equal 9, Octal.new('011').to_decimal
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
    # skip
    assert_equal 0, Octal.new('234abc').to_decimal
  end
end