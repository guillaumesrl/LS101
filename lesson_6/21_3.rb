MAX_SCORE = 5

require 'io/console'

def continue_game
  prompt "Press any key to continue !"
  STDIN.getch
end

def prompt(message)
  puts "=> #{message}"
end

def display_all_cards(cards, player)
  lines = { line1: '', line2: '', line3: '', line4: '', line5: '' }

  test(cards, lines)


  display_lines(player, lines)
end

def display_lines(player, lines)
  puts "  #{player} cards are :"
  lines.each_value {|value| puts value}
end

def test(cards, lines)
  counter = 0
  loop do
    lines[:line1] << "   _____ "
    lines[:line2] << "  |     |"
    lines[:line3] << "  |  #{cards[counter][0]}  |"
    lines[:line4] << if cards[counter][1].size < 2
               "  |  #{cards[counter][1]}  |"
             else
               "  |  #{cards[counter][1]} |"
             end
    lines[:line5] << "  |_____|"
    counter += 1
    break if counter == cards.size
  end
end

# Displays only one card for dealer and ? for the second one
def display_one_card(cards, player)
  line1 = "   _____ "
  line2 = "  |     |"
  line3 = "  |  #{cards[0][0]}  |"
  # Trick to handle the display of a two digit card (10)
  line4 = if cards[0][1].size < 2
            "  |  #{cards[0][1]}  |"
          else
            "  |  #{cards[0][1]} |"
          end
  line5 = "  |_____|"
  counter = 0

  loop do
    line1 << "   _____ "
    line2 << "  |     |"
    line3 << "  |  ?  |"
    line4 << "  |  ?  |"
    line5 << "  |_____|"
    counter += 1
    break if counter == cards.size - 1
  end

  puts "  #{player} cards are :"
  puts line1, line2, line3, line4, line5, ' '
end


def display_game(player_cards, dealer_cards, step, phrase = nil)
  case step
  when 1
    system 'clear'
    puts " "
    display_one_card(dealer_cards, 'Dealer\'s')
    display_all_cards(player_cards, 'Your')
  when 2
    system 'clear'
    prompt phrase
    display_all_cards(dealer_cards, 'dealer\'s')
    display_all_cards(player_cards, 'your')
  end
end

# Deck is initialized and shuffled
def initialize_deck
  families = ['♠', '♥', '♦', '♣']
  figures = ['A'] + [*'2'..'10'] + ['V', 'Q', 'K']
  deck = []
  families.each do |family|
    figures.each do |value|
      deck << [family, value]
    end
  end
  deck.shuffle
end

def initial_cards(deck, player_cards, dealer_cards)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

# New card
def new_card!(cards, deck)
  cards << deck.pop
end

def valid_hit_or_stay
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if ['h', 's'].include?answer
    prompt "Not a valid choice, (h)it or (s)tay ?"
  end
  answer
end

def player_hit_or_stay!(player_cards, dealer_cards, deck, step)
  loop do
    display_game(player_cards, dealer_cards, step)
    prompt "Will you (h)it or (s)tay ?"
    answer = valid_hit_or_stay
    new_card!(player_cards, deck) if answer == 'h'
    if answer == 's' || busted?(player_cards)
      break
    end
  end
end

# return the score
def calculate_score(cards)
  score_arr = cards.map do |arr|
    if arr[1].to_i > 0
      arr[1].to_i
    elsif arr[1] == 'A'
      11
    else
      10
    end
  end

  loop do
    if score_arr.sum > 21 && score_arr.include?(11)
      score_arr[score_arr.find_index(11)] = 1
    else
      break
    end
  end

  score_arr.sum
end

def busted?(player_cards = [], dealer_cards = [])
  calculate_score(player_cards) > 21 || calculate_score(dealer_cards) > 21
end

def dealer_hit_or_stay!(player_cards, dealer_cards, deck, step)
  phrase = 'dealer is playing'
  loop do
    system 'clear'
    puts " "
    prompt "Dealer is playing !"
    display_game(player_cards, dealer_cards, step, phrase)
    dealer_score = calculate_score(dealer_cards)
    if dealer_score < 17
      new_card!(dealer_cards, deck)
    else
      sleep 1.5
      break
    end
    sleep 1.5
  end
end

def display_score_game(score)
  if score['player'] == MAX_SCORE
    prompt "You won this game ! You : #{score['player']} , Dealer : #{score['dealer']}"
  elsif score['dealer'] == MAX_SCORE
    prompt "Dealer won this game ! You : #{score['player']} , Dealer : #{score['dealer']}"
  else
    prompt "You have #{score['player']} , the Dealer has #{score['dealer']}"
  end
  puts ''
  continue_game
end

def winner_game?(score)
  score['player'] == MAX_SCORE || score['dealer'] == MAX_SCORE
end

def reset_score!(score)
  score['player'] = 0 && score['dealer'] = 0
end

def welcome(score)
  if score.values == [0, 0]
    prompt "Welcome to this game ! First to 21 wins !"
    continue_game
  end
end

def play_again?
  answer = nil
  loop do
    prompt "Do you want to play again ? Y/N"
    answer = gets.chomp.downcase
    if answer == 'y'
      answer = true
      break
    elsif answer == 'n'
      answer = false
      break
    else
      prompt "Not a correct choice"
    end
  end
  answer
end

def calculate_winner_round(player_cards, dealer_cards)
  player_total = calculate_score(player_cards)
  dealer_total = calculate_score(dealer_cards)

  if player_total > 21
    return 'player busted', player_total, dealer_total
  elsif dealer_total > 21
    return 'dealer busted', player_total, dealer_total
  elsif dealer_total < player_total
    return 'player', player_total, dealer_total
  elsif dealer_total > player_total
    return 'dealer', player_total, dealer_total
  else
    return 'tie', player_total, dealer_total
  end
end

def increment_score!(player_cards, dealer_cards, score)
  winner = calculate_winner_round(player_cards, dealer_cards)
  case winner[0]
  when 'dealer busted' then score['player'] += 1
  when 'player busted' then score['dealer'] += 1
  when 'dealer' then score['dealer'] += 1
  when 'player' then score['player'] += 1
  end
end

def display_winner_round(player_cards, dealer_cards, step)
  result, player_total, dealer_total = calculate_winner_round(player_cards, dealer_cards)
  display_game(player_cards, dealer_cards, step)
  case result
  when 'dealer busted' then prompt "Dealer busted ! You win! You #{player_total}, Dealer : #{dealer_total}"
  when 'player busted' then prompt "You busted ! Dealer wins ! You #{player_total}, Dealer : #{dealer_total}"
  when 'dealer' then prompt "Dealer wins! You #{player_total}, Dealer : #{dealer_total}"
  when 'player' then prompt "You win! You #{player_total}, Dealer : #{dealer_total}"
  when 'tie' then prompt "It's a tie! You #{player_total}, Dealer : #{dealer_total}"
  end
end

total_score = { 'player' => 0, 'dealer' => 0 }
loop do
  
  welcome(total_score)
  while total_score.values.sort.last < 5
    deck = initialize_deck
    player_cards = []
    dealer_cards = []
    step = 1

    initial_cards(deck, player_cards, dealer_cards)
    player_hit_or_stay!(player_cards, dealer_cards, deck, step)
    step = 2

    if busted?(player_cards)
      display_winner_round(player_cards, dealer_cards, step)
      increment_score!(player_cards, dealer_cards, total_score)
      display_score_game(total_score)
      next
    end

    prompt "You chose to stay, let's see who'll win !"
    continue_game

    dealer_hit_or_stay!(player_cards, dealer_cards, deck, step)
    display_winner_round(player_cards, dealer_cards, step)
    increment_score!(player_cards, dealer_cards, total_score)
    display_score_game(total_score)
  end

  reset_score!(total_score)
  break unless play_again?
end

prompt "Goodbye"
