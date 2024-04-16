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

class Deck
  SUITS_STRINGS = ["\u2666", "\u2663", "\u2665", "\u2660"].map { |unicode| unicode.encode('utf-8')}
  
  SUITS_SYMBOLS = SUITS_STRINGS.map(&:to_sym)
  
  VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)

  attr_accessor :cards
  
  def initialize
    self.cards = []
    SUITS_SYMBOLS.each do |suit|
      VALUES.each do |value|
        self.cards << Card.new(suit, value)
      end
    end
    shuffle_deck!
  end

  def shuffle_deck!
    self.cards.shuffle!
  end

  def deal
    cards.pop
  end
end

class Card
  attr_accessor :suit, :value

  def initialize(suit, value)
    self.suit = suit
    self.value = value
  end

  def to_s
    "#{value} #{suit}"
  end
end

class Hand
  attr_accessor :cards, :name
  def initialize(name)
    self.cards = []
    self.name = name
  end

  def add_card(card)
    self.cards << card
  end

  def calculate_total
    total = 0

    cards.each do |card|
      if card.value == "A"
        total += 11
      elsif card.value.to_i == 0
        total += 10
      else
        total += card.value.to_i
      end
    end

    # Correct Ace situation
    cards.select { |card| card.value == "A"}
         .count
         .times { total -= 10 if total > 21}
    
         total
  end

  def busted?
    calculate_total > 21
  end

  def display
    puts ""
    puts "#{name} Total points: #{calculate_total}"
    cards.each { |card| puts card}
  end

  def display_partial
    total = 0
    if cards.first.value == "A"
      total = 11
    elsif %w(J Q K).include? cards.first.value
      total = 10
    else
      total = cards.first.value.to_i
    end

    puts ""
    puts "#{name} Total points: #{total}"
    puts "#{cards.first}"
    puts "???"
  end
end

class Participant
  attr_accessor :name, :hand

  def initialize
    self.name = set_name
    self.hand = Hand.new(name)
  end

  def draw_card(card)
    hand.add_card(card)
  end

  def total_point
    hand.calculate_total
  end

  def show_hand
    hand.display
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
  ROBOTS = ['R2D2', 'Hal', 'Chappie', 'Sonny', '777']

  def set_name
    ROBOTS.sample
  end

  def show_partial_hand
    hand.display_partial
  end
end

class TwentyOne
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def display_welcome_message
    puts "Welcome #{player.name} to Twenty One!"
  end

  def deal_cards
    2.times do
      player.hand.add_card(deck.deal)
      dealer.hand.add_card(deck.deal)
    end
  end

  def clear_console
    system "clear"
  end

  def show_initial_hands
    player.show_hand
    dealer.show_partial_hand
  end
  
  def show_current_hands
    clear_console
    player.show_hand
    dealer.show_partial_hand
  end

  def show_all_hands
    clear_console
    player.show_hand
    dealer.show_hand
  end

  def player_turn
    loop do
      break if player.total_point >= 21
      puts ""

      puts "Do you want to (h)it or (s)tand?:"
      choice = gets.chomp.strip.downcase

      case choice
      when 'h'
        player.draw_card(deck.deal)
        show_current_hands
      when 's'
        break
      else
        puts "Invalid choice! Please enter 'h' for hit or 's' for stand"
      end
    end
  end
  
  def dealer_turn
    loop do
      break if dealer.total_point >= 17
      puts "#{dealer.name} hits!"
      dealer.draw_card(deck.deal)
    end
  end
   
  def display_result
    show_all_hands
    puts ""
    if player.hand.busted?
      puts "#{player.name} is busted! #{dealer.name} wins." 
    elsif dealer.hand.busted?
      puts "#{dealer.name} is busted! #{player.name} wins!" 
    elsif player.total_point > dealer.total_point
      puts "#{player.name} wins!" 
    elsif player.total_point < dealer.total_point
      puts "#{dealer.name} wins!"
    else
      puts "It's a tie!"
    end
  end
  
  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again?"
      answer = gets.chomp.strip.downcase
      break if %w(y n).include? answer
      puts "Sorry, invalid answer. Please enter (y)es or (n)o!"
    end
    
    answer == "y" 
  end

  def reset
    self.deck = Deck.new
    self.hand = Hand.new(player.name)
    self.hand = Hand.new(dealer.name)
  end

  def play
    display_welcome_message

    loop do
      deal_cards
      show_initial_hands
      player_turn

      show_all_hands
      dealer_turn
      show_all_hands
      display_result
      play_again? ? reset : break
    end
  end
end

game = TwentyOne.new
game.play
