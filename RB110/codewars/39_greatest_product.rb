=begin
SECOND TRY 16 MINS
39. Largest product in a series

(https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)

6 kyu

Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of

digits.

For example:

greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

PROBLEM
-------
- find the greates product of five consecutive digits from given string

EXAMPLES
--------
92494737828244222221111111532909999
92494 73782 82442 22221 11111 15329 09999
24947 37828 24422 22211 11111 53290 
49473 78282 44222 22111 11115 32909
.....

DATA STRUCTURES
---------------
- input: string that contains numbers in string format

- counter for greatest product of given number
- helper method to calculate product of given number

- output: greatest product of all of sub-strings of 5

ALGORITHM
---------
- helper method `find_product`
  - input: string of numbers
  - output: int that is product of all of the digits

  - transform given str of numberse in to an array contains all numbers
    - to_i, digits, reduce
  - return the product
---------------------------------------------------------------
- create counter for greatest product of given number
  - max_product = 0
- create all consecutive digits combinations
  - iterate from idx(0 to last - 5)
    - if product of current combinations > max_product
      - reassign max_product to product of current combinations
- return the max_product

=end

def find_product(str)
  num = str.chars.map(&:to_i)
  num.reduce(1) {|product, n| product *= n}
end

def greatest_product(str)
  max_product = 0

  (0..str.size - 5).each do |idx|
    p combination = str[idx,5]
    max_product = find_product(combination) if find_product(combination)  > max_product
  end
  max_product
end


# p greatest_product("123834539327238239583") == 3240

# p greatest_product("395831238345393272382") == 3240

# p greatest_product("92494737828244222221111111532909999") == 5292

# p greatest_product("92494737828244222221111111532909999") == 5292

p greatest_product("02494037820244202221011110532909999") == 0

