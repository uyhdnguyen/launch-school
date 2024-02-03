
=begin
Tic Tac Toe is a 2 player game played on a 3x3 board. Each player takes a turn and
marks a square on the board. First player to reach 3 squares in a row, including diagonals,
wins. If all 9 squares are marked and no player has 3 squares in a row, then the game is a tie.

- PROBLEM
  - Input: user inputs strings which mark a square on the board
  - Output:
    - empty board with prompt to mark
    - filled board with computer's mark and player's mark
    - prompt winner
    - prompt to play again

  - Rules:
    - Explicit:
      - board has 3x3 squares
      - players take turns
      - 3 squares in a row, inculding diagonals, wins
      - 9 squares are marked and no player has 3 squares in a row is tie
    - Implicit:
      - how to mark square?
        - the mark is 1 single char inside a square
      - how the board looks like?
        - each square on the board is formed from minimum 3 lines

- EXAMPLES AND TEST CASES
  - empty square & mark square
    ----------
    |   |  x |
    ----------

- DATA STRUCTURE
  - Input: strings
  - Output: strings, integeres
  - Combination? of array and hash

- ALGORITHM
  General:
    1. display welcome message
    2. display rules, user's mark, computer's mark, empty board
    3. ask user to mark the square
    4. display marked board with computer's mark
    5. repeat  step 3 and 4 
      - until the board is full -> display tie
      - there are winner -> display winner
    7. ask play again?
    8. if yes, reapat from step 1
    9. display goodby message
  Detail:
    1. create prompt method to display messages
    2. create board method to display the board
    3. create board_status method to keep the board's state
    4. create is_winner? method to decide who's the winner
=end

require 'pry'

SPACE = ' '
CORNER = '+'
SEPARATOR = '|'

EMPTY_MARK = " "
PLAYER_MARK = "x"
COMPUTER_MARK = "o"

WINNER = 'W'
LOSER = 'L'
TIE = 'T'

MESSAGES = YAML.load_file('tic_tac_toe_messages.yml')  

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts "=> #{message}"
end

def initialize_board
  (1..9).each_with_object({}) {|num, new_board| new_board[num] = ' '}
end

def display_board(brd)
  # top spacer
  puts ""

  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"

  # bottom spacer
  puts ""
end

def empty_squares(brd)
  brd.keys.select {|key| brd[key] == EMPTY_MARK}
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
    when 0
    ""
    when 1
      "#{arr.first}"
    when 2
      "#{arr.first} #{word} #{arr.last}"
    else
      "#{arr[0..-2].join(delimiter)}#{delimiter}#{word} #{arr.last}"
  end
end

def player_turn!(brd)
  player_position = ''

  loop do
    prompt "Choose a square from #{joinor(empty_squares(brd))} "
    player_position = gets.chomp.to_i
    break if empty_squares(brd).include?(player_position)
    prompt "Please enter valid choice!"  
  end

  brd[player_position] = PLAYER_MARK
end

def computer_turn!(brd)
  computer_turn = empty_squares(brd).sample
  brd[computer_turn] = COMPUTER_MARK
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def winner?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  winning_lines = [
                    [1,2,3], [4,5,6], [7,8,9],
                    [1,4,7], [2,5,8], [3,6,9],
                    [1,5,9], [3,5,7]
                  ]
  winning_lines.each do |line|
    if brd[line[0]] == PLAYER_MARK &&
       brd[line[1]] == PLAYER_MARK &&
       brd[line[2]] == PLAYER_MARK
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARK &&
          brd[line[1]] == COMPUTER_MARK &&
          brd[line[2]] == COMPUTER_MARK
      return 'Computer'
    end
  end
  nil
end

def score_board(brd,scr)
  if detect_winner(brd) == 'Player'
    scr[:player] += 1
  elsif detect_winner(brd) == 'Computer'
    scr[:computer] += 1
  end
  scr
end

# Main logic
score = {player: 0, computer: 0}

loop do
  board = initialize_board
  display_board(board)
  score_board(board,score)
  loop do 
    player_turn!(board)
   
    display_board(board)
    score_board(board,score)
    break if winner?(board) || board_full?(board)
    computer_turn!(board)
   
    display_board(board)
    score_board(board,score)
    break if winner?(board) || board_full?(board)
  end

  if winner?(board) 
    prompt("#{detect_winner(board)} won!")
  else
    prompt("It's a tie!")
  end

  prompt("Play again?")
  answer = gets.chomp.downcase

  break unless answer.start_with?('y')
end