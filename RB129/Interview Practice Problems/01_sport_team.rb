# Design a Sports Team (Author Unknown...thank you!)

# - Include 4 players (attacker, midfielder, defender, goalkeeper)
# - All the players’ jersey is blue, except the goalkeeper, his jersey is white with blue stripes
# - All players can run and shoot the ball.
# - Attacker should be able to lob the ball
# - Midfielder should be able to pass the ball
# - Defender should be able to block the ball
# - The referee has a whistle. He wears black and is able to run and whistle.

module Runnable
  def run
    puts "Running"
  end
end

class Player
  include Runnable
  
  attr_reader :jersey_color

  def initialize(jersey_color = "Blue")
    @jersey_color = jersey_color
  end

  def shoot
    puts "Shooting"
  end
end

class Attacker < Player
  def lob
    puts "Lobbing"
  end
end

class Midfielder < Player
  def pass
    puts "Passing"
  end
end

class Defender < Player
  def block
    puts "Blocking"
  end
end

class Goalkeeper < Player
  def initialize(jersey_color = "Blue Stripes")
    super(jersey_color)
  end
end

class Referee
  include Runnable
  
  attr_reader :jersey_color

  def initialize(jersey_color = "Black")
    @jersey_color = jersey_color
  end

  def whistle
    puts "Whistling"
  end
end

attacker = Attacker.new
midfielder = Midfielder.new
defender = Defender.new
goalkeeper = Goalkeeper.new
referee = Referee.new

attacker.run
midfielder.shoot
defender.run

p attacker.jersey_color
p midfielder.jersey_color
p defender.jersey_color

p goalkeeper.jersey_color

p referee.jersey_color

