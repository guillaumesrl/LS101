class Score
  attr_accessor :score

  def initialize
    @score = 0
  end

  def increment
    @score += 1
  end

  def print
    puts "#{@score}"
  end

  def reset_score
    @score = 0
  end
end

class Player < Score
  attr_accessor :move, :name
  def initialize
    @move = nil
    set_name
    super
  end
end

class Human < Player
  def set_name
    name_human = nil
    loop do
      puts "What's your name ?"
      name_human = gets.chomp
      break unless name_human.empty?
      puts "Enter a valid choice"
    end
    self.name = name_human
  end

  def choose
    choice = nil
    loop do
      puts "You have to make a choice : rock, paper or scissors ?"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
    end
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'ALF'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  attr_reader :value
  VALUES = ['rock', 'paper', 'scissors']
  def initialize(value)
    @value = value
  end

  def scissors?
    @value == 'scissors'
  end

  def paper?
    @value == 'paper'
  end

  def rock?
    @value == 'rock'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to our RPS game"
  end

  def display_goodbye_message
    puts "Thanks for playing, Goodbye !"
  end

  def winner_game?
    human.score == 5 || computer.score == 5
  end

  def display_winner_game
    if human.score == 5
      puts "Congrats, you won the game #{human.score} - #{computer.score} !"
    else
      puts "Sorry, computer won the game ! #{computer.score} - #{human.score}"
    end
    human.reset_score && computer.reset_score
  end


  def display_winner_round
    puts "#{human.name} chose #{human.move.value} - #{computer.name} chose #{computer.move.value}"
    if human.move > computer.move
      human.increment
      puts "You won the round !"
    elsif human.move < computer.move
      computer.increment
      puts "Computer won the round"
    else
      human.increment && computer.increment
      puts "it's a tie for this round"
    end
  end

  def play_again?
    decision = nil
    loop do
      puts "Do you want to play again ? y/n"
      decision = gets.chomp
      break if ['y', 'n'].include?(decision)
      puts "Enter a valid choice"
    end
    decision == 'y' ? true : false
  end

  def play
    display_welcome_message
    loop do
      loop do
        human.choose
        computer.choose
        display_winner_round
        break if winner_game?
      end
      display_winner_game
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play
