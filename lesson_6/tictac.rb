PLAYER_MARK = 'X'
COMPUTER_MARK = 'O'
INITIAL_MARK = ' '

def display_board(brd = ' ')
  system 'clear'
  puts "   1   2    3 "
  puts "A #{brd['A'][0]}  | #{brd['A'][1]}  | #{brd['A'][2]}  "
  puts " ----+----+---" 
  puts "B #{brd['B'][0]}  | #{brd['B'][1]}  | #{brd['B'][2]}  "
  puts " ----+----+---"
  puts "C #{brd['C'][0]}  | #{brd['C'][1]}  | #{brd['C'][2]}  "
  puts ""
end

def initiate_board
  clean_board = {}
  ('A'..'C').each {|letter| clean_board[letter] = [INITIAL_MARK]*3 }
  clean_board
end


def player_plays!(brd)
  loop do 
    puts "What do you want to play ?"
    choice = gets.chomp
    if valid_choice(brd, choice)
      brd[choice.chars.first.capitalize][choice.chars.last.to_i-1] = PLAYER_MARK
      break
    else
      puts "You can't play that !"
    end
  end
end

def valid_choice(brd, choice)
  ('A'..'C').include?(choice.chars.first) &&
  choice.chars.size == 2  &&
  brd[choice.chars.first.capitalize][choice.chars.last.to_i-1] == INITIAL_MARK
end

def computer_plays!(brd)
  sample_key = possibilities(brd).keys.sample.to_s
  comp_choice = sample_key+possibilities(brd)[sample_key].sample.to_s
  brd[comp_choice.chars.first.capitalize][comp_choice.chars.last.to_i] = 'O'
end


def possibilities(brd)
  brd.map do |key , value|
    [key, value.map.with_index {|val, i| i if val == INITIAL_MARK }.compact]
  end.to_h.delete_if {|key, value| key > 'C' ||  value == []}
end

def winner(brd)
  brd['V1'] = [brd['A'][0], brd['B'][0], brd['C'][0]]
  brd['V2'] = [brd['A'][1], brd['B'][1], brd['C'][1]]
  brd['V3'] = [brd['A'][2], brd['B'][2], brd['C'][2]]
  brd['D1'] = [brd['A'][0], brd['B'][1], brd['C'][2]]
  brd['D2'] = [brd['A'][2], brd['B'][1], brd['C'][0]]
  if brd.has_value?(['X','X','X'])
    "you"
  elsif brd.has_value?(['O','O','O'])
    "comp"
  end
end

def full?(brd)
  brd.values.flatten.include?(" ")
end

loop do
  board = initiate_board
  possibilities = possibilities(board)
  puts "Welcome to this round !"
  puts "You are X, computer is O"
  display_board(board)

  loop do 
    player_plays!(board)
    computer_plays!(board) unless possibilities(board).empty?
    display_board(board)
    break if winner(board) || !full?(board)
  end
  if winner(board)
    puts "#{winner(board)} won !"
  else
    puts "That's a tie !"
  end
  puts "New Party ? Y/N"
  choice = gets.chomp
  break if choice == 'N'
end
