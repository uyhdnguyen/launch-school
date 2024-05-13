# =begin
# PROBLEM
# -------
# input: positive integer
# output: integer that is bigger and formed by the same digits

# - return -1
#   - single digit 
#   - no combinations that is larger than input
# - all positive inputs

# EXAMPLES
# --------
# 9 -> -1
# 12 -> 21
# 111 -> -1

# DATA STRUCTURES
# - array to hold digits

# ALGORITHM
# ---------
# - create an array to hold all of the digits
#   - `digits`, to_i, chars
# - find max number
#   - create combinations of input numbers size
#     - combination, map, to_i
#   - sort all combinations
#     - sort
#   - find the next bigger number
#     - iterate through combinations 
# - return bigger number

# =end

# def next_bigger_num(num)
#   return - 1 if num.to_s.size < 2 

#   digits = num.to_s.chars
  
#   combinations = digits.permutation(digits.size).map(&:join).map(&:to_i)

#   result = combinations.select{|n| n > num}
#   if result.empty?
#     -1
#   else 
#     result.sort.first
#   end
# end

# p next_bigger_num(9)
# p next_bigger_num(12)
# p next_bigger_num(513)
# p next_bigger_num(2017)
# p next_bigger_num(111)
# p next_bigger_num(531)
# p next_bigger_num(123456789)
