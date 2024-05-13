# Write a program that asks the user to enter an integer greater than 0,
# then asks if the user wants to determine the sum or product of all numbers
# between 1 and the entered integer.

def sum_product_of_consecutive_integers()
  puts "=> Please enter an integer greater than 0:"
  number = gets.chomp.to_i

  answer = ''

  loop do
  puts "=> Enter 's' to compute the sum, 'p' to compute the product."
  answer = gets.chomp.downcase

  if answer == 's' || answer == 'p'
    break
  else
    puts "=> Please enter valid response."
  end
  end

  range = (1..number).to_a

  sum = 0
  product = 1

  range.each { |num| sum += num }
  range.each { |num| product *= num }

  case answer
  when 's'
    puts "The sum of the integers between 1 and #{number} is #{sum}."
  when 'p'
    puts "The product of the integers between 1 and #{number} is #{product}."
  end

end

sum_product_of_consecutive_integers