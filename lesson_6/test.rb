score_player = 0
score_computer = 0

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]



def ai_defense(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2 &&
       brd.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      line.each do |val| brd[val] = COMPUTER_MARKER if brd[val] == INITIAL_MARKER
    return 'played'
    break
    end
  end
end



board = {1=> 'X',2=> ' ', 3=>'X', 4=>'X', 5=>'0',6=>'X', 7 => ' '}
line = [1,4,7]
p board.values_at(line[0], line[1], line[2]).index(INITIAL_MARKER)
p board



