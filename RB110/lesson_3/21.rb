=begin

- PROBLEM
  - Input: 
  - Output: 

  - Rules:
    - Explicit:
      - "dealer"
      - "player"
      - Start:
        - "dealer" is dealt 2 cards
        - "player" is dealt 2 cards
      - card_status "2" -> "10" are worth their face value
      - J,Q and K are worth 10
      - Ace are worth 1 or 11
      - Player always goes first
        - "hit" or "stay"
      - Dealer only show 1 card_status and other card_status is hidden
      - Dealer rules
        - only hit if total < 17
    - Implicit:

- EXAMPLES AND TEST CASES
  - 

- DATA STRUCTURE
  - Input: 
  - Output: 
  - Array? Hash? Combination?

- ALGORITHM
  1. Initialize deck
  2. Deal cards to player and dealer
  3. Player turn: hit or stay
    - repeat until bust or "stay"
  4. If player bust, dealer wins.
  5. Dealer turn: hit or stay
    - repeat until total >= 17
  6. If dealer bust, player wins.
  7. Compare cards and declare winner.

=end
SUITS_SYMBOLS = ["\u2666", "\u2663", "\u2665", "\u2660"].map do |unicode|
  unicode.encode('utf-8')
end

SUITS_TO_SYMBOLS = SUITS_SYMBOLS.map(&:to_sym)

VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def clear_console
  system 'cls'
end

def initialize_deck
  SUITS_TO_SYMBOLS.product(VALUES).shuffle!
end

def fold_card
  <<-TEXT
  +-----+ 
  |-----|
  |-----|
  |-----|
  +-----+
  TEXT
end

def unfold_card
  <<-TEXT
  +-----+
  |v    |
  |  s  |
  |    v|
  +-----+
  TEXT
end

def unfold_card_special
  <<-TEXT
  +-----+
  |v   |
  |  s  |
  |   v|
  +-----+
  TEXT
end

def get_card_from_deck(dck)
  dck.pop
end

def Initialize_card(card_status,input_card)
  new_input_card = '' 

  card_status.each_char do |char|
    if char == 'v'
      new_input_card << input_card
  .last
    elsif char == 's'
      new_input_card << input_card
  .first.to_s
    else
      new_input_card << char
    end
  end
  new_input_card
end


 
  


################################################################################
deck = initialize_deck


control_center = {player: [], computer: []}

control_center[:player] <<  get_card_from_deck(deck)
control_center[:player] << get_card_from_deck(deck)

p control_center[:player]

# puts deck.size
