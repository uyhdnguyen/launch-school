# Build a program that randomly generates and prints Teddy's age. To get the age,
# you should generate a random number between 20 and 200.

def how_old_is_teddy?()
  puts "What's your name?"
  answer = gets.chomp

  answer = answer.empty? ? 'Teddy' : answer

  # random_age = (20..200).to_a.sample
  random_age = rand(20..200)

  puts "#{answer} is #{random_age} years old!"
end

how_old_is_teddy?
