

class Board
  WINNING_LINES = [
    [1,2,3], [4,5,6], [7,8,9],
    [1,4,7], [2,5,8], [3,6,9],
    [1,5,9], [3,5,7]
  ]

  INITIAL_MARKER = ' '

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def set_square_at(position, marker)
    @squares[position].marker = marker
  end

  def empty_squares
    @squares.select { |k, v| v.marker == INITIAL_MARKER}.keys
  end

  def is_full?
    empty_squares.empty?
  end

  def someone_won?
    !!winner_marker
  end


  def winner_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      if three_identical_markers?(squares)
        return squares.first.marker
      end
    end
    nil
  end

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new(INITIAL_MARKER)}
  end

  def draw
    puts " #{@squares[1]} | #{@squares[2]} | #{@squares[3]} "
    puts "---+---+---"
    puts " #{@squares[4]} | #{@squares[5]} | #{@squares[6]} "
    puts "---+---+---"
    puts " #{@squares[7]} | #{@squares[8]} | #{@squares[9]} "
  end


end

class Square
  attr_accessor :marker
  def initialize(marker)
    @marker = marker
    # status to keep track of the square mark
  end

  def marked?
    marker != Board::INITIAL_MARKER
  end

  def to_s
    @marker
  end
end

class Player
  def initialize(marker)
    @marker = marker
  end

  def marker
    @marker
  end
end

class TTTgame
  HUMAN_MARK = 'X'
  COMPUTER_MARK = 'O'
  FIRST_TO_MOVE = HUMAN_MARK
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARK)
    @computer = Player.new(COMPUTER_MARK)
    @current_marker = FIRST_TO_MOVE
  end

  def play
    display_welcome_message
    
    loop do #play again loop
      display_board

      loop do #turn loop
        current_player_moves
        break if board.someone_won? || board.is_full?
        clear_screen_and_display_board if human_turn?
      end
      display_result
      break unless play_again?
      reset

    end
    
    display_goodbye_message
  end

  private

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker == COMPUTER_MARK
    else
      computer_moves
      @current_marker == HUMAN_MARK
    end
  end

  def human_turn?
    @current_marker == HUMAN_MARK
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for Playing Tic Tac Toe"
  end

  def display_board
    puts "You're #{human.marker}, computer is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    puts "You're #{human.marker}, computer is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def human_moves
    puts "Choose a square between #{board.empty_squares.join(", ")}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.empty_squares.include?(square)
      puts "Not a valid choice !"
    end
    board[square] = human.marker
  end

  def computer_moves
    board[board.empty_squares.to_a.sample] = computer.marker
  end

  def display_result
    clear_screen_and_display_board
    case board.winner_marker
    when human.marker
      puts "you won"
    when computer.marker
      puts "computer won"
    else
    puts "The board is full, it's a tie !"
    end
  end

  def play_again?
    puts "Would you like to play again ? y/n"
    answer = nil
    loop do
      answer = gets.chomp
      break if ['y', 'n'].include?(answer)
    end
    
    answer == 'y'
  end

  def clear
    system 'clear'
  end

  def reset
    board.reset
    @current_marker = HUMAN_MARK
    clear
    puts "Let's play again !"
    puts ""
  end
end


game = TTTgame.new
game.play


