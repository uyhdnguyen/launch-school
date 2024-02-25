def sum_square_difference(number)
  square_of_sum_digits = (1..number).sum ** 2

  sum_of_square_digits = 1.upto(number).reduce(0) do |sum, num|
    sum += num**2
  end

  square_of_sum_digits - sum_of_square_digits
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150