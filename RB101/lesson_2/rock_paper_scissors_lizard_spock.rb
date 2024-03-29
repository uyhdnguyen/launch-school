VALID_CHOICES = %w(rock paper scissors lizard spock)

def prompt(message)
    puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'rock' && second == 'lizard') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'paper' && second == 'spock') ||
    (first == 'scissors' && second == 'paper') ||
    (first == 'scissors' && second == 'lizard') ||
    (first == 'lizard' && second == 'paper') ||
    (first == 'lizard' && second == 'spock') ||
    (first == 'spock' && second == 'rock') ||
    (first == 'spock' && second == 'scissors')
end

def display_results(player,computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lose!")
  else
    prompt("It's a tie")
  end
end

loop do
  choice = ''
  
  loop do
    prompt ("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    
    if choice.downcase.start_with?('r', 'p', 'sc', 'l', 'sp') || 
      VALID_CHOICE.include?(choice)
      case choice
        when 'r'
          choice = 'rock'
        when 'p'
          choice = 'paper'
        when 'sc'
          choice = 'scissor'
        when 'l'
          choice = 'lizard'
        when 'sp'
          choice = 'spock'
      end
      break
    else
        prompt("That's not a valid choice")
    end
  end
  
  computer_choice = VALID_CHOICES.sample
  
  prompt("You chose: #{choice}")
  prompt("Computer chose: #{computer_choice}")
  
  display_results(choice, computer_choice)
  
  prompt("Do you want to play again?")
  
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

 prompt("Thank you for playing. Good bye!")
 