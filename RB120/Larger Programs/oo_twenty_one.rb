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

=end
class Participant
  attr_accessor :name

  def initialize
    @name = set_name
  end
end

class Player < Participant
  def set_name
    loop do
      puts "What's your name?"
      answer = gets.chomp.strip.capitalize
      break unless answer.empty?
      puts "Sorry, invalid input!"
    end
  end
end

class Dealer < Participant
end

class Deck
  SUITS_SYMBOLS = ["\u2666", "\u2663", "\u2665", "\u2660"].map { |unicode| unicode.encode('utf-8')}
  
  SUITS_TO_SYMBOLS = SUITS_SYMBOLS.map(&:to_sym)
  
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  SUITS = %w(J Q K)
end

class Card
  def up_card
  end

  def down_card
  end
end

class TwentyOne
  def initialize
    puts Time.now.strftime('%H:%M:%S')
    @player = Player.new
    @dealer = Dealer.new
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