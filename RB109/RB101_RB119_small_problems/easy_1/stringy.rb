# Write a method that takes one argument, a positive integer, and returns a
# string of alternating 1s and 0s, always starting with 1. The length of the
# string should match the given integer.

def stringy1(num)
  result = ''

  num.times do |i|
    if i.even?
      result << '1'
    elsif i.odd?
      result << '0'
    end
  end

  result
end

def stringy2(num)
  result = []

  num.times do |i|
    number = i.even? ?  1 : 0
    result << number
  end

  result.join
end

def stringy3(num1, num2 = 1)
  result = []

  num1.times do |i|

    if num2 == 0
      number = i.even? ?  0 : 1
      result << number
    else
      number = i.even? ?  1 : 0
      result << number
    end
  end

  result.join
end

puts stringy1(6) == '101010'
puts stringy1(9) == '101010101'
puts stringy1(4) == '1010'
puts stringy1(7) == '1010101'

puts stringy2(6) == '101010'
puts stringy2(9) == '101010101'
puts stringy2(4) == '1010'
puts stringy2(7) == '1010101'

puts stringy3(6,0) == '010101'
puts stringy3(6) == '101010'