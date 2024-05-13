
# You will be given a number and you will need to return it as a string in expanded form. For example:
#
# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
#
# Note: All numbers will be whole numbers greater than 0.

=begin

- PROBLEM
  - Input: integer
  - Output: string in expanded form 12 -> '12 + 2'
    - given a number
    - return it as a string in expanded form

  - Rules:
    - Explicit:
      - return a new string in expanded form 42 -> '40 + 2'
      - all numbers are whole numbers
      - all numbers > 0

    - Implicit:
      - return number with base 10, 100, 1000 and so on...
      - if start number = 0 -> return nothing
        70304 -> 70000, 300, 4
        70314 -> 70000, 300, 10, 4
      - single-digit number -> return self?

- EXAMPLES AND TEST CASES
  - expanded_form(12); # Should return '10 + 2'
  - expanded_form(42); # Should return '40 + 2'
  - expanded_form(70304); # Should return '70000 + 300 + 4'

- DATA STRUCTURE
  - Input: integer
  - Output: string
  - Array?

- ALGORITHM
  - convert the input number into array
  - initialize result local variable
  - iterate through the sorted array
    - if number is not equal 0
      - push that number to result string
  - return the result

=end

def expanded_form(number)
  numbers = number.digits.reverse
  result = []

  numbers.each_with_index do |num, index|
    if index != numbers.size  && num != 0
      result << num.to_s + '0' * (numbers.size - (index + 1)) << ' + '
    end
  end

  result[0..-2].join
end

p expanded_form(12) == '10 + 2'
p expanded_form(42) == '40 + 2'
p expanded_form(70304) == '70000 + 300 + 4'