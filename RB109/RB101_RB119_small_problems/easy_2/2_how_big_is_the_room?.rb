# Build a program that asks a user for the length and width of a room in meters
# and then displays the area of the room in both square meters and square feet.

# Note: 1 square meter == 10.7639 square feet

# Do not worry about validating the input at this time.

def prompt(message)
  puts "=> #{message}"
end

def how_big_is_the_room?()
  prompt('What would you like to measure in?')
  prompt('A for meters')
  prompt('B for feet')
  answer = gets.downcase.chomp

  if answer == 'a'
    prompt('Enter the length of the room in meters:')
    length = gets.chomp.to_f

    prompt('Enter the width of the room in meters:')
    width = gets.chomp.to_f

    result = length * width

    prompt("The area of the room is #{result} square meters (#{(result*10.7639).round(2)} square feet)")

  else
    prompt('Enter the length of the room in feet:')
    length = gets.chomp.to_f

    prompt('Enter the width of the room in feet:')
    width = gets.chomp.to_f

    result = length * width

    prompt("The area of the room is #{(result)} square feet (#{(result/10.7639).round(2)} square meter)")
  end
end

how_big_is_the_room?
