=begin
Problem:
--------
Twenty-One is a card game consisting of a dealer and a player, where the participants try to get as close to 21 as possible without going over.

Here is an overview of the game:
- Both participants are initially dealt 2 cards from a 52-card deck.
- The player takes the first turn, and can "hit" or "stay".
- If the player busts, he loses. If he stays, it's the dealer's turn.
- The dealer must hit until his cards add up to at least 17.
- If he busts, the player wins. If both player and dealer stays, then the highest total wins.
- If both totals are equal, then it's a tie, and nobody wins.

Nouns: card, player, dealer, participant, deck, game, total
Verbs: deal, hit, stay, busts


Organization:
-------------
Player
- hit
- stay
- busted?
- total
Dealer
- hit
- stay
- busted?
- total
- deal (should this be here, or in Deck?)
Participant
Deck
- deal (should this be here, or in Dealer?)
Card
Game
- start

CRC (Class, Responsibilities, Collaborators)
--------------------------------------------
- Participant -> 
  - has name
  - can hit
  - can stay
  - can determine if busted
  - can count total
  
=end

class Hand
  attr_accessor :cards

  def initialize
    self.cards = []
  end

  def display_upper_card(hnd)
    upper_row = ''
  
    (hnd.size).times do |index|
      if hnd[index].last != '10'
        upper_row += "|" + hnd[index].last + " " * 4 + "|"
      else
        upper_row += "|" + hnd[index].last + " " * 3 + "|"
      end
    end
  
    puts upper_row
  end
  
  def display_middle_card(hnd)
    middle_row = ''
  
    (hnd.size).times do |index|
      middle_row += "|" + " " * 2 + hnd[index].first.to_s + " " * 2 + "|"
    end
  
    puts middle_row
  end
  
  def display_lower_card(hnd)
    lower_row = ''
  
    (hnd.size).times do |index|
      if hnd[index].last != '10'
        lower_row += "|" + " " * 4 + hnd[index].last + "|"
      else
        lower_row += "|" + " " * 3 + hnd[index].last + "|"
      end
    end
  
    puts lower_row
  end

  def display_hand(hnd)
    puts "+-----+" * hnd.size
   
    display_upper_card(hnd)
    display_middle_card(hnd)
    display_lower_card(hnd)
  
    puts "+-----+" * hnd.size
    puts ""
  end
  
  def display_dealer_hand(hnd)
    puts "+-----++-----+" 
    if hnd[0].last != '10'
      puts "|" + hnd[0].last + " " * 4 + "|" + "|*****|"
      puts "|" + " " * 2 + hnd[0].first.to_s + " " * 2 + "|" + "|*****|"
      puts "|" + " " * 4 + hnd[0].last + "|" + "|*****|"
    else
      puts "|" + hnd[0].last + " " * 3 + "|" + "|*****|"
      puts "|" + " " * 2 + hnd[0].first.to_s + " " * 2 + "|" + "|*****|"
      puts "|" + " " * 3 + hnd[0].last + "|" + "|*****|"  
    end
    puts "+-----++-----+" 
    puts ""
  end
end

class Participant
  attr_accessor :name, :hand

  def initialize
    self.name = set_name
    self.hand = Hand.new
  end
end

class Player < Participant
  def set_name
    name_input = nil
    loop do
      puts "What's your name?"
      name_input = gets.chomp.strip.capitalize
      break unless name_input.empty?
      puts "Sorry, invalid input!"
    end
    name_input
  end

  
end

class Dealer < Participant
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5']

  def set_name
    ROBOTS.sample
  end
end

class Deck
  attr_accessor :cards
  
  def initialize
    self.cards = []
    new_deck.each{|card| self.cards << Card.new(card.first, card.last)}

    shuffle_deck!
  end

  def new_deck
    Card::SUITS_SYMBOLS.product(Card::VALUES)
  end

  def shuffle_deck!
    self.cards.shuffle!
  end
end

class Card
  SUITS_STRINGS = ["\u2666", "\u2663", "\u2665", "\u2660"].map { |unicode| unicode.encode('utf-8')}
  
  SUITS_SYMBOLS = SUITS_STRINGS.map(&:to_sym)
  
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  
  SUITS = %w(J Q K)

  attr_accessor :suit, :face

  def initialize(suit, face)
    self.suit = suit
    self.face = face
  end

  def to_s
    [face, suit]
  end
end

class TwentyOne
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def deal_cards
    
  end

  def clear_console
    system "clear"
  end

  def play
    deal_cards
    show_initial_cards
    player_turn
    dealer_turn
    show_result
  end
end

game = TwentyOne.new

puts game.deck.cards.pop

# class Person
#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "My name is #{@name}"
#   end
# end

# puts Person.new("Joe")