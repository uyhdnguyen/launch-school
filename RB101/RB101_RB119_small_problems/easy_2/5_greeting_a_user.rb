# Write a program that will ask for user's name. The program will then greet
# the user. If the user writes "name!" then the computer yells back to the user.

# What is your name? Bob
# Hello Bob.

# What is your name? Bob!
# HELLO BOB. WHY ARE WE SCREAMING?

def greeting_a_user()
  print "=> What is your name? "
  name = gets.chomp

  puts name.include?('!') ? "HELLO #{name.upcase.chop}. WHY ARE WE SCREAMING?" : "Hello #{name.capitalize}."
end

greeting_a_user
