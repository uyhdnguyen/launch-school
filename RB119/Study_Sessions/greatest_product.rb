=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

PROBLEM
-------
- input: string that represents number
- output: integer that represents the product of 5 digits

- find product of five consecutive digits
- no empty string

EXAMPLES
--------
"123834539327238239583"
12383 23834 38345 83453 34539 45393 53932 39327 93272 32723 27238 72382 23823 38239 82395 23958 39583
-> 3240

DATA STRUCTURES
---------------
- array contains all substrings
- product variable to keep track of greatest product

ALGORITHM
---------
- create `find_product`
  - input: array of digits in string format
  - output: integer that represent product
  - find the product of given array
    - `reduce` method
  - return the product
-------------------------------------------
- create greatest product counter
  - `greatest_p`
- transform the given integer string into array of digits
  - `digits`
- create array contains all substrings
  - iterate trhough each digits in `digits`
    - index(0 -> last - 5) with the range of 5
  - find the product of each substring by calling `find_product`
  - reassign `greatest_product` to new product if new products is greater than current `greatest_product`
  - return `greatest_product`
=end

# OPTION 1
def find_product(arr)
  arr.reduce(1) { |product, num| product *= num}
end

def greatest_product(str)
  subarr = []

  greatest_p = 0

  digits = str.to_i.digits.reverse

  (0..digits.size - 5).each do |idx|
    sub_digits = digits[idx, 5]

    greatest_p = find_product(sub_digits) if find_product(sub_digits) > greatest_p
    
  end

  greatest_p
end

# OPTION 2

# def greatest_product(str)
#   res = str.chars.each_cons(5).to_a
  

#   res.map do |array|
#     if array.first.to_i == 0
#       0
#     else
#       array.map(&:to_i).inject(:*)
#     end
#   end.max

# end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292

p greatest_product("02494037820244202221011110532909999") == 0
