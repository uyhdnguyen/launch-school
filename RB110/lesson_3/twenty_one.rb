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
  7. Compare cards and declare   winner.

=end
require 'pry'

player_champion = <<-MSG
###   #      ##   #   #  ####  ###
  #  #  #     #  #  #   #  #     #  #
  ###   #     ####   ###   ###   ###
  #     #     #  #    #    #     #  #
  #     ####  #  #    #    ####  #  #
  
  #       #   #####   ##    #    ####
  #       #     #     # #   #   #
  #   #   #     #     #  #  #    ###
   #  #  #      #     #   # #       #
    ## ##     #####   #    ##   ####

    The Player is the GRAND CHAMPION!
MSG

dealer_champion = "The Dealer is the GRAND CHAMPION."

 SUITS_SYMBOLS = ["\u2666", "\u2663", "\u2665", "\u2660"].map do |unicode|
    unicode.encode('utf-8')
  end
  
  SUITS_TO_SYMBOLS = SUITS_SYMBOLS.map(&:to_sym)
  
  VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
  
  SUITS = %w(J Q K)

def prompt(msg)
  puts ">> #{msg}"
end

def clear_console
  system 'cls'
end

def initialize_deck
  SUITS_TO_SYMBOLS.product(VALUES).shuffle
end

def get_card_from_deck(dck)
  dck.pop
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

def busted?(hnd)
  total(hnd) > 21
end

def total(hnd)
  values = hnd.map{ |card| card.last}

  sum = 0
  values.each do |value|
    if SUITS.include?(value)
      sum += 10
    elsif value == 'A'
      sum += 11
    else
      sum += value.to_i
    end
  end

  values.count('A'). times do
    sum -= 10 if sum > 21
  end

  sum
end

def display_title(title="TWENTY-ONE")
  top_bottom_edge = '-' * (title.length + 2)

  puts "+#{top_bottom_edge}+"
  puts "| #{title} |"
  puts "+#{top_bottom_edge}+"
  puts ''
end

def dash_board(stats)
  puts "----ROUND #{stats[:round_number]}----"
  puts "Player Wins: #{stats[:player_wins]}"
  puts "Dealer Wins: #{stats[:dealer_wins]}"
  puts "---------------"
  puts ""
end

def display_title_dashboard_total_cards_hidden(dck,player,dealer, stats)
  clear_console

  display_title

  dash_board(stats)

  # display hidden dealer total
  puts "DEALER TOTAL: ?"
  # display dealer's hidden hand
  display_dealer_hand(dealer)

  # display player's total
  puts "PLAYER TOTAL: #{total(player)}"
  # display player's hand
  display_hand(player)
end

def display_title_dashboard_total_cards(dck,player,dealer, stats)
  clear_console

  display_title

  dash_board(stats)

  # display hidden dealer total
  puts "DEALER TOTAL: #{total(dealer)}"
  # display dealer's hidden hand
  display_hand(dealer)

  # display player's total
  puts "PLAYER TOTAL: #{total(player)}"
  # display player's hand
  display_hand(player)
end

def detect_winner(player,dealer,stats)
  if total(player) > total(dealer)
    prompt("Player win!")
    sleep(1.5)
    stats[:player_wins] += 1
  elsif total(player) < total(dealer)
    prompt("Dealer win!")
    sleep(1.5)
    stats[:dealer_wins] += 1
  elsif total(player) == total(dealer)
    prompt("It's a tie!")
    sleep(1.5)
  end
end

def detect_champion(stats,player_msg, dealer_msg)
  clear_console

  if stats[:player_wins] > stats[:dealer_wins]
    puts player_msg
  else
    puts dealer_msg
  end
end

def goodbye_message
  puts "-------------------------------------------------"
  puts "Thanks for playing Twenty-One! See you next time."
  puts ""
end

################################################################################

statistics = {player_wins: 0, dealer_wins: 0, round_number: 1 }

clear_console

puts <<-MSG
===== Welcome to Twenty-One! =====

What would you like to do?

1. New Game
2. View Instructions
3. Quit

MSG

answer = nil

loop do
  answer = gets.chomp.downcase
  break if %w(1 2 3).include?(answer)
  prompt("That's not valid input. Please choose 1, 2 or 3")
end

case answer
  when '1'
    loop do
      break if statistics[:round_number] > 5

      deck = initialize_deck

      player_cards = []
      dealer_cards = []
      
      # deals cards to player and dealer
      2.times do
        player_cards << get_card_from_deck(deck)
        dealer_cards << get_card_from_deck(deck)
      end

      display_title_dashboard_total_cards_hidden(deck, player_cards, dealer_cards,statistics)

      # player's turn
      loop do
        player_command = nil

        loop do
          prompt("(H) Hit or (S) Stay ?")

          player_command = gets.chomp.downcase
          
          break if ['h', 's'].include?(player_command)

          prompt("Invalid response. Please choose to (h) hit or (s) stay.")
        end

        player_cards << get_card_from_deck(deck) if player_command.start_with?('h')

        display_title_dashboard_total_cards_hidden(deck, player_cards, dealer_cards,statistics)

        break if busted?(player_cards) || player_command.start_with?('s')
      end
        
      if busted?(player_cards)
        prompt("Player is busted!")
        prompt("Dealer wins!")
        sleep(1.5)
        statistics[:dealer_wins] += 1
        statistics[:round_number] += 1
        # play_again? ? next : break
        next
      else
        prompt("Player stays!")
        sleep(1.5)
        display_title_dashboard_total_cards_hidden(deck, player_cards, dealer_cards,statistics)
      end

      # dealer's turn
      prompt("Dealer reveals their cards!")
      sleep(1.5)
      loop do
        # display_title_dashboard_total_cards_hidden(deck, player_cards, dealer_cards,statistics)
        display_title_dashboard_total_cards(deck, player_cards, dealer_cards,statistics)

        break if total(dealer_cards) >= 17

        prompt("Dealer hits!")
        dealer_cards << get_card_from_deck(deck)
        sleep(1.5)
      end

      if busted?(dealer_cards)
        display_title_dashboard_total_cards(deck, player_cards, dealer_cards,statistics)
        prompt("Dealer is busted!")
        prompt("Player wins!")
        sleep(1.5)
        statistics[:player_wins] += 1
        statistics[:round_number] += 1
        next
      else
        display_title_dashboard_total_cards(deck, player_cards, dealer_cards,statistics)
        prompt("Dealer stays!")
        sleep(1.5) 
      end

      display_title_dashboard_total_cards(deck, player_cards, dealer_cards,statistics)
      detect_winner(player_cards, dealer_cards,statistics)

      # play_again?
      statistics[:round_number] += 1
    end

    detect_champion(statistics, player_champion, dealer_champion)

    goodbye_message

  when '2'
    clear_console

    puts <<-TEXT
    === Welcome to Twenty-One! ===

  It's YOU versus the DEALER. The player closest to 21 without going over wins!



  *** CARD VALUES ***

  - All numbered cards are equal to their value.
  
    Jack   - 10
    Queen  - 10
    King   - 10
    Ace    - 1 or 11

  - Jokers have been removed.
    TEXT
    
  else
    return
end
