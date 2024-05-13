# def dig_pow(num, pow)
#   result = 0
#   num.to_s.chars.each do |n|
#     result += n.to_i**pow
#     pow += 1
#   end
#   return -1 if result < num
#   result / num
# end

# p dig_pow(89, 1) == 1
# p dig_pow(92, 1) == -1
# p dig_pow(46288, 3) == 51
# p dig_pow(695, 2) == 2


