
VALID_CHOICE_HASH = {
  'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
  'l' => 'lizard', 'sp' => 'spock'
}

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'paper' || second == 'spock')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

def display_winner(user, computer)
  if win?(user, computer)
    prompt("You picked #{user} and computer picked #{computer} : YOU WIN")
  elsif win?(computer, user)
    prompt("You picked #{user} and computer picked #{computer} : YOU LOOSE")
  else
    prompt("You picked #{user} and computer picked #{computer} : That's a tie")
  end
end

def increment_score(score, user, computer)
  if win?(user, computer)
    score['s_user'] += 1
  elsif win?(computer, user)
    score['s_computer'] += 1
  end
end
  

def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt("Welcome to our game, first to five wins !")

loop do
  score = {"s_user" => 0 , "s_computer" => 0}
  loop do
    prompt("Make jour choice :")
    VALID_CHOICE_HASH.each do |k, v|
      print "#{k} = #{v}, "
    end

    user_letter = ''
    user = ''

    loop do
      puts
      user_letter = Kernel.gets().chomp()
      if VALID_CHOICE_HASH.key?(user_letter)
        user = VALID_CHOICE_HASH[user_letter]
        break
      else
        prompt("Please, choose a valid weapon!")
      end
    end

    computer = VALID_CHOICE_HASH.values.sample()
    display_winner(user, computer)
    increment_score(score, user, computer)
    puts "user : #{score['s_user']} , computer : #{score['s_computer']}"
    break if score['s_user'] == 5 || score['s_computer'] == 5
  end
  prompt("Do you Want to play again ? Y/N")
  again = Kernel.gets().chomp()
  break if again.downcase == 'n' 
end
