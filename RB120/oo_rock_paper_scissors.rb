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
  include Comparable
  attr_accessor :move

  WINS = {
    "rock" => ["scissors", "lizard"],
    "paper" => ["rock", "spock"],
    "scissors" => ["lizard", "paper"],
    "lizard" => ["paper", "spock"],
    "spock" => ["rock", "scissors"]
  }

  MOVE_NAMES = WINS.keys

  def initialize(name)
    self.move = name
  end
 
  def <=>(other_move)
    if WINS[name].include?(other_move.name)
      1
    elsif self.name == other_move.name
      0
    else
      -1
    end
  end

  def to_s
    @name
  end

end

class Score
  def initialize
    @human_score = 0
    @computer_score = 0
  end
  
  def increas_score(winner)
    case winner
    when :human_wins
      @human_score += 1
    when :computer_wins
      @computer_score += 1
    end
  end
  
  def display_score(type)
    case type
    when :human
      @human_score
    when :computer
      @computer_score
    end
  end
end

class Player
  attr_accessor :name, :move
  
  def initialize
    @name = valid_name
    @move = nil
  end
end

class Human < Player
  def valid_name
    loop do
      puts "What's your name?"
      name = gets.chomp.delete('^A-Za-z').capitalize
      return name unless name.empty?
      puts "Please enter a valid name (only alphabets accepted)."
    end
  end
  
  def valid_move
    loop do
      puts "Please choose rock, paper, scissor, lizard or spock:"
      choice = gets.chomp.downcase.strip
      return choice if %w(rock paper scissors lizard spock).include? choice
    end
  end

  def set_move
    self.move = Move.new(valid_move)
  end
  
end

class Computer < Player
  def valid_name
    %w(Sunny Robot Pippy).sample
  end
  
  def set_move
    self.move = Move.new(Move::MOVE_NAMES.sample)
  end
end


class RPSLSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock Paper Scissors Lizard Spock!"
  end

  def display_goodbye_message
    puts "Thank you for playing. Goodbye!"
  end


  def play
    display_welcome_message
    human.set_move
    
    # computer.turn
    # display_winner
    display_goodbye_message
  end
end

RPSLSGame.new.play
