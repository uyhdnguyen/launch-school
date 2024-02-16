=begin
[Train: Largest product in a series \| Codewars](https://www.codewars.com/kata/529872bdd0f550a06b00026e/train/ruby)
6 kyu
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.

For example:

greatestProduct("123834539327238239583") // should return 3240
The input string always has more than five digits.

NOTES:
 "123834539327238239583".chars.each_cons(5).to_a.map(&:join) *********
P:
- method takes an str of digits as an argument
- method calculates sum of each of those slices of 5
- method returns the greatest PRODUCT

p greatest_product("123834539327238239583") == 3240

p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0

N:
"123834539327238239583".chars.each_cons(5).to_a.map(&:join).map{ |s| s.to_i.digits.inject(:*) }
A:
- iterate over the str and prepare substrings
- iterate from index 0 to the str size minus one - starting index
- iterate from starting_index to the str size minus one - starting index

=end
def greatest_product(str)
  res = str.chars.each_cons(5).to_a
  

  res.map do |array|
    if array.first.to_i == 0
      0
    else
      array.map(&:to_i).inject(:*)
    end
  end.max

end

p greatest_product("123834539327238239583") == 3240
p greatest_product("395831238345393272382") == 3240
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("92494737828244222221111111532909999") == 5292
p greatest_product("02494037820244202221011110532909999") == 0
