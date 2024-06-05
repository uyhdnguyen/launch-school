=begin
  PROBLEM
  -------
  - natural numbers
  - numbers are identify into 
    - abundant
    - perfect
    - deficient
  - numbers are compared based on number and the sum of its positive divisors
  - perfect numbers ha an aliquot sum that is equal to the original number
  - abundant numbers have an aliquot sum that is greater than the original number
  - deficient numbers have an aliquot sum that is less than the original number
  - PROGRAM RETURN TYPE OF NUMBER : PERFECT, ABUNDANT, DEFICIENT

  EXAMPLES/ TEST CASES
  --------------------
  - 6 : 1, 2, 3 (PERFECT NUMBER)
    1 + 2 + 3 = 6

  - 28 : 1, 2, 4, 7 and 14 (PERFECT NUMBER)
    1 + 2 + 4 + 7 + 14 = 28

  - 15 : 1,3 ,5 (DEFICIENT NUMBER)
    1 + 3 + 5 = 9

  - 24 : 1, 2, 3, 4, 6 ,8, 12 (ABUNDANT NUMBER)
    1 + 2 + 3 + 4 + 6 + 8 + 12 = 24

  DATA STRUCTURES
  ---------------
  - INPUT: integer
  - OUTPUT: string

  - INTERMEDIATE:
    - array that keeps track of divisors

  ALGORITHM
  ---------
  - create class PerfectNumber
  - create classify class method to identify type of number that takes given integer as argument
    - create an array that keeps track of divisors
      - res = []
    - find all divisors of given number
      - create a range from 1 to given number
        - (1..num)
      - iterate through the range to select divisors
        - push the number in the range to the `res` if given num % number in range == 0
      - return the sum of `res`
      - compare the sum to the given number to return 
        - deficient
        - perfect
        - abundant
  
=end

class PerfectNumber
  def self.classify(num)
    raises StandardError if num <= 0

    res = []

    (1..num - 1).each do |n|
      res << n if num % n == 0
    end

    comparision = res.sum

    if comparision < num
      "deficient"
    elsif comparision == num
      "perfect"
    else
      "abundant"
    end
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    # skip
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    # skip
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    # skip
    assert_equal 'abundant', PerfectNumber.classify(12)
  end
end=begin
PROBLEM
-------
- natural numbers
- numbers are identify into 
  - abundant
  - perfect
  - deficient
- numbers are compared based on number and the sum of its positive divisors
- perfect numbers ha an aliquot sum that is equal to the original number
- abundant numbers have an aliquot sum that is greater than the original number
- deficient numbers have an aliquot sum that is less than the original number
- PROGRAM RETURN TYPE OF NUMBER : PERFECT, ABUNDANT, DEFICIENT

EXAMPLES/ TEST CASES
--------------------
- 6 : 1, 2, 3 (PERFECT NUMBER)
  1 + 2 + 3 = 6

- 28 : 1, 2, 4, 7 and 14 (PERFECT NUMBER)
  1 + 2 + 4 + 7 + 14 = 28

- 15 : 1,3 ,5 (DEFICIENT NUMBER)
  1 + 3 + 5 = 9

- 24 : 1, 2, 3, 4, 6 ,8, 12 (ABUNDANT NUMBER)
  1 + 2 + 3 + 4 + 6 + 8 + 12 = 24

DATA STRUCTURES
---------------
- INPUT: integer
- OUTPUT: string

- INTERMEDIATE:
  - array that keeps track of divisors

ALGORITHM
---------
- create class PerfectNumber
- create classify class method to identify type of number that takes given integer as argument
  - create an array that keeps track of divisors
    - res = []
  - find all divisors of given number
    - create a range from 1 to given number
      - (1..num)
    - iterate through the range to select divisors
      - push the number in the range to the `res` if given num % number in range == 0
    - return the sum of `res`
    - compare the sum to the given number to return 
      - deficient
      - perfect
      - abundant

=end

class PerfectNumber
def self.classify(num)
  raises StandardError if num <= 0

  res = []

  (1..num - 1).each do |n|
    res << n if num % n == 0
  end

  comparision = res.sum

  if comparision < num
    "deficient"
  elsif comparision == num
    "perfect"
  else
    "abundant"
  end
end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
def test_initialize_perfect_number
  assert_raises StandardError do
    PerfectNumber.classify(-1)
  end
end

def test_classify_deficient
  # skip
  assert_equal 'deficient', PerfectNumber.classify(13)
end

def test_classify_perfect
  # skip
  assert_equal 'perfect', PerfectNumber.classify(28)
end

def test_classify_abundant
  # skip
  assert_equal 'abundant', PerfectNumber.classify(12)
end
end