INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, firstsep = ", ", lastsep = 'or')
  case arr.size
  when 0 then ' '
  when 1 then arr.first
  when 2 then arr.join(firstsep)
  else
    arr[-1] = "#{lastsep} #{arr.last}"
    arr.join(firstsep)
  end
end

def display_board(brd)
  system "clear"
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
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square : #{joinor(empty_squares(brd))}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def ai_defense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2 &&
       brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      line.each { |val| brd[val] = COMPUTER_MARKER if brd[val] == INITIAL_MARKER}
    return 'played'
    end
  end
end

def computer_places_piece!(brd)
  unless ai_defense(brd) == 'played'
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return "player"
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "computer"
    end
  end
  nil
end

def total_score(winner, score_player, score_computer)
  if winner == 'player'
    score_player += 1
  elsif winner == 'computer'
    score_computer += 1
  end
  return score_player, score_computer
end

score_player = 0
score_computer = 0

loop do
  board = initialize_board
  display_board(board)

  loop do
    player_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    prompt "#{detect_winner(board)} won !"
  else
    prompt "it's a tie"
  end

  score_player, score_computer = total_score(detect_winner(board), score_player, score_computer)

  prompt "Player : #{score_player} - Computer : #{score_computer}"
  prompt "Wanna play again ? (y/n)"
  choice = gets.chomp
  break unless choice.downcase.start_with?('y')
end
