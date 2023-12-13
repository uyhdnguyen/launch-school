# Write a method that takes two arguments: the first is the starting number, and
# the second is the ending number. Print out all numbers from the starting number
# to the ending number, except if a number is divisible by 3, print "Fizz", if a
# number is divisible by 5, print "Buzz", and finally if a number is divisible by
# 3 and 5, print "FizzBuzz".

# Example:

# fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz,
# 13, 14, FizzBuzz

def fizzbuzz(start_number, end_number)
  result = []

  (start_number..end_number).to_a.each do |num|
    if num % 3 == 0 && num % 5 == 0
      result << "FizzBuzz"
    elsif num % 3 == 0
      result << "Fizz"
    elsif num % 5 == 0
      result << "Buzz"
    else
      result << num
    end
  end
  p result.join(', ')
end

fizzbuzz(1,15)