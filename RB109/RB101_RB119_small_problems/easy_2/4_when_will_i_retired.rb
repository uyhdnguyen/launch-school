# Build a program that displays when the user will retire and how many years she
# has to work till retirement.

# Example:

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

def when_will_i_retire?()
  puts "=> What is your age?"
  age = gets.chomp.to_i

  puts "=> At what age would you like to retire?"
  retired_age = gets.chomp.to_i

  current_year = Time.now.year

  duration = retired_age - age

  retired_year = current_year + duration

  puts "=> It's #{current_year}. You will retire in #{retired_year}"

  puts "=> You have only #{duration} years of work to go!"
end

when_will_i_retire?
