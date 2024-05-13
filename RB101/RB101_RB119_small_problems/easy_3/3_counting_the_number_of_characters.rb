# Write a program that will ask a user for an input of a word or multiple words
# and give back the number of characters. Spaces should not be counted as a
# character.

# input:
# Please write word or multiple words: walk

# output:
# There are 4 characters in "walk".

# input:
# Please write word or multiple words: walk, don't run

# output:
# There are 13 characters in "walk, don't run".

puts "Please write word or multiple words: "
input = gets.chomp

number_of_characters = input.delete(' ').length

# counter = 0
# input.each_char { |char| counter +=1 if char != ' '}


puts "There are #{number_of_characters} characters in \"#{input}\". "