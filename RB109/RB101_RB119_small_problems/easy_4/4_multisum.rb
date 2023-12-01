# Write a method that searches for all multiples of 3 or 5 that lie between 1
# and some other number, and then computes the sum of those multiples.
# For instance, if the supplied number is 20, the result should be
# 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

# You may assume that the number passed in is an integer greater than 1.

# multisum(3) == 3
# multisum(5) == 8
# multisum(10) == 33
# multisum(1000) == 234168

# def multisum(number)
#   range = (1..number).to_a
#   list = range.select {|num| num % 3 == 0 || num % 5 == 0}
#   list.sum
# end


def multisum(number)
  # (1..number).to_a.select { |num| num % 3 == 0 || num % 5 == 0 }.inject(0, :+)
  (1..number).reduce do |sum,num|
    sum += (num % 3 == 0 || num % 5 == 0 ? num : 0)
  end
end

p multisum(3)

p multisum(5)

p multisum(10)
