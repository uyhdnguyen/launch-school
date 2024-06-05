=begin
PROBLEM
-------

I stands for 1
V stands for 5
X stands for 10
L stands for 50
C stands for 100
D stands for 500
M stands for 1000
Do not care about number 3000
each digit of the number separately, starting with the left most digit and skipping any digit wi a value of 0

EXAMPLES
--------

XLVIII == 48
48.divmod 50 => [0, 48]
48.divmod 40 => [1, 8]
8.divmod 5 => [1, 3]
3.divmod 1 => [3, 0]

DATA STRUCTURES
---------------
- INPUT: integer to roman number
- OUTPUT: string that represents roman numerial

- INTERMEDIATE: 
  - a string that is a placeholder to append required letters for roman numbers
- NOTES:
  - using divmod method that returns array of mul and remainders
  - a,b = [1,2]
    - a = 1
    - b = 2
  -
ALGORITHM
---------
- Create a hash that contains all possible combinations of roman numeral
  - ROMAN_NUMERALS
- Create constructor method that takes an integer as argument
  - def initialize(num)
- Create to_roman method that converts @num to its roman numeral version
  - Create a result string
    - res = ""
  - Create a copy of @num so all operations are performed on this copy
    - to_convert = @num
  - Transform given num into its roman numeral
    - iterate through ROMAN_NUMERALS
    - use divmod to get the multiplier and remainder
    - reassign to_convert to the remainder for the rest of iteration
    - return res

=end

class RomanNumeral
  
  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(num)
    @num = num
  end

  def to_roman
    res = ""
    to_convert = @num

    ROMAN_NUMERALS
    .sort_by { |k,v| -v}
    .each do |pair|
      mul, rem = to_convert.divmod pair.last

      res += pair.first * mul if mul > 0

      to_convert = rem
    end
    
    res
  end
end

require 'minitest/autorun'
# require_relative 'roman_numerals'
require 'minitest/reporters'
Minitest::Reporters.use!L

class RomanNumeralsTest < Minitest::Test
  def test_1
    number = RomanNumeral.new(1)
    assert_equal 'I', number.to_roman
  end

  def test_2
    # skip
    number = RomanNumeral.new(2)
    assert_equal 'II', number.to_roman
  end

  def test_3
    # skip
    number = RomanNumeral.new(3)
    assert_equal 'III', number.to_roman
  end

  def test_4
    # skip
    number = RomanNumeral.new(4)
    assert_equal 'IV', number.to_roman
  end

  def test_5
    # skip
    number = RomanNumeral.new(5)
    assert_equal 'V', number.to_roman
  end

  def test_6
    # skip
    number = RomanNumeral.new(6)
    assert_equal 'VI', number.to_roman
  end

  def test_9
    # skip
    number = RomanNumeral.new(9)
    assert_equal 'IX', number.to_roman
  end

  def test_27
    # skip
    number = RomanNumeral.new(27)
    assert_equal 'XXVII', number.to_roman
  end

  def test_48
    # skip
    number = RomanNumeral.new(48)
    assert_equal 'XLVIII', number.to_roman
  end

  def test_59
    # skip
    number = RomanNumeral.new(59)
    assert_equal 'LIX', number.to_roman
  end

  def test_93
    # skip
    number = RomanNumeral.new(93)
    assert_equal 'XCIII', number.to_roman
  end

  def test_141
    # skip
    number = RomanNumeral.new(141)
    assert_equal 'CXLI', number.to_roman
  end

  def test_163
    # skip
    number = RomanNumeral.new(163)
    assert_equal 'CLXIII', number.to_roman
  end

  def test_402
    # skip
    number = RomanNumeral.new(402)
    assert_equal 'CDII', number.to_roman
  end

  def test_575
    # skip
    number = RomanNumeral.new(575)
    assert_equal 'DLXXV', number.to_roman
  end

  def test_911
    # skip
    number = RomanNumeral.new(911)
    assert_equal 'CMXI', number.to_roman
  end

  def test_1024
    # skip
    number = RomanNumeral.new(1024)
    assert_equal 'MXXIV', number.to_roman
  end

  def test_3000
    # skip
    number = RomanNumeral.new(3000)
    assert_equal 'MMM', number.to_roman
  end
end
