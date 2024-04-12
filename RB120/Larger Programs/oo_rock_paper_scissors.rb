=begin
Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the players chose the same move, then it's a tie.

Nouns: player, move, rule
Verbs: choose, compare
=end
class Move
  WINS = {
    "rock" => ["scissors", "lizard"],
    "paper" => ["rock", "spock"],
    "scissors" => ["lizard", "paper"],
    "lizard" => ["paper", "spock"],
    "spock" => ["rock", "scissors"]
  }

  include Comparable

  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def <=>(other_move)
    if WINS[name].include? other_move.name
      1
    elsif name == other_move.name
      0
    else
      -1
    end
  end

  def to_s
    name
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    self.name = set_name
    self.move = nil
    self.score = 0
  end
end

class Human < Player
  def set_name
    answer = ""
    loop do
      puts "What's your name?"
      answer = gets.chomp.downcase.strip.capitalize
      break unless answer.empty?

      puts "Sorry, please enter a value"
    end
    self.name = answer
  end

  def choose
    choice = nil

    loop do
      puts "Please choose rock, paper, scissors, lizard, or spock:"
      choice = gets.chomp.downcase.strip
      break if %w(rock paper scissors lizard spock).include? choice

      puts "Sorry, invalid choice"
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = %w(Robot AI Sunny Rockstar 777).sample
  end

  def choose
    self.move = Move.new(%w(rock paper scissors lizard spock).sample)
  end
end

class Dashboard
  attr_accessor :scores, :round_number, :human, :computer

  def initialize(human, computer)
    self.scores = {human: 0, computer: 0}
    self.round_number = 1
    self.human = human
    self.computer = computer
  end

  def set_scores(winner)
    case winner
    when :human
      scores[:human] += 1
    when :computer
      scores[:computer] += 1
    end
  end

  def display_scores
    puts "Round #{round_number} - Scores: #{scores[:human]} (#{human.name}) | #{scores[:computer]} (#{computer.name})"
  end

  def increment_round_number
    self.round_number += 1
  end
end

class RPSGame
  attr_accessor :human, :computer, :dashboard

  def initialize
    self.human = Human.new
    self.computer = Computer.new
    self.dashboard = Dashboard.new(human, computer)
  end

  def display_welcome_message
    puts "Hello #{human.name}! Welcome to Rock, Paper, Scissors, Lizard, Spock!"
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock. Goodbye!"
  end

  def display_winner(winner)
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"

    case winner
    when :human
      puts "#{human.name} won!"
    when :computer
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase.strip
      break if %w(y n).include? answer

      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def determine_winner
    if human.move > computer.move
      :human
    elsif human.move < computer.move
      :computer
    else
      :tie
    end
  end

  def play
    display_welcome_message

    loop do
      break if dashboard.round_number > 10

      system "clear"
      dashboard.display_scores
      human.choose
      computer.choose
      winner = determine_winner
      display_winner(winner)
      dashboard.set_scores(winner) unless winner == :tie
      dashboard.increment_round_number
      break unless play_again?
    end

    display_goodbye_message
  end
end

game = RPSGame.new
game.play
