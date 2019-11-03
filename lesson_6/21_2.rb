MAX_SCORE = 5
DEALER_LIMIT = 17
BUSTED_LIMIT = 21

require 'io/console'

def continue_game
  prompt "Press any key to continue !"
  STDIN.getch
end

def prompt(message)
  puts "=> #{message}"
end

# Display all cards with family and value
def display_all_cards(cards, player)
  lines = { line1: '', line2: '', line3: '', line4: '', line5: '' }
  generate_all_cards!(cards, lines)
  puts "  #{player} cards are :"
  lines.each_value { |value| puts value }
  puts ''
end

# Generate all cards by modifying lines hash
def generate_all_cards!(cards, lines)
  counter = 0
  loop do
    lines[:line1] << "   _____ "
    lines[:line2] << "  |     |"
    lines[:line3] << "  |  #{cards[counter][0]}  |"
    # Trick to handle the display of a two digit card (10)
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
  line1 = "   _____    _____ "
  line2 = "  |     |  |     |"
  line3 = "  |  #{cards[0][0]}  |  |  ?  |"
  # Trick to handle the display of a two digit card (10)
  line4 = if cards[0][1].size < 2
            "  |  #{cards[0][1]}  |  |  ?  |"
          else
            "  |  #{cards[0][1]} |  |  ?  |"
          end
  line5 = "  |_____|  |_____|"

  puts "  #{player} cards are :"
  puts line1, line2, line3, line4, line5, ' '
end

# Display Game, step handles the all_card/one_card choice
def display_game(player_cards, dealer_cards, step, phrase = nil)
  case step
  when 1
    system 'clear'
    puts " "
    display_one_card(dealer_cards, 'Dealer\'s')
    display_all_cards(player_cards, 'Your')
  when 2
    system 'clear'
    display_phrase(phrase)
    display_all_cards(dealer_cards, 'dealer\'s')
    display_all_cards(player_cards, 'your')
  end
end

# display phrase if dealer is playing
def display_phrase(phrase)
  if phrase
    prompt phrase
  else
    puts ''
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

# Initial cards for both players
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

# Check input validity for hit or stay choice
def valid_hit_or_stay
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if ['h', 's'].include?answer
    prompt "Not a valid choice, (h)it or (s)tay ?"
  end
  answer
end

# Player hit/stay : 1) display game 2) check input 3) new nard or break
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

# return the total value of cards
def calculate_total(cards)
  total = 0
  values = cards.map { |card| card[1] }
  values.each do |value|
    total += if value == 'A'
               11
             elsif value.to_i == 0
               10
             else
               value.to_i
             end
  end
  values.select { |value| value == 'A' }.count.times do
    total -= 10 if total > BUSTED_LIMIT
  end
  total
end

# Check if player busted
def busted?(player_cards)
  player_score = calculate_total(player_cards)
  player_score > BUSTED_LIMIT
end

# dealer hit or stay
def dealer_hit_or_stay!(player_cards, dealer_cards, deck, step)
  phrase = 'dealer is playing'
  loop do
    system 'clear'
    puts " "
    prompt "Dealer is playing !"
    display_game(player_cards, dealer_cards, step, phrase)
    dealer_score = calculate_total(dealer_cards)
    if dealer_score < DEALER_LIMIT
      new_card!(dealer_cards, deck)
    else
      sleep 1.5
      break
    end
    sleep 1.5
  end
end

# Display score the game. (game end = first to 5 rounds)
def display_game_score(score)
  winner_game = winner_game?(score)
  case winner_game
  when 'player'
    prompt "You won this game #{score['player']} - #{score['dealer']} !"
  when 'dealer'
    prompt "Dealer won this game #{score['dealer']} - #{score['player']} ! "
  when 'no'
    prompt "Game score : You #{score['player']} , Dealer : #{score['dealer']}"
  end
  puts ''
  continue_game
end

# Detect winner for the game
def winner_game?(score)
  if score['player'] == MAX_SCORE
    'player'
  elsif score['dealer'] == MAX_SCORE
    'dealer'
  else
    'no'
  end
end

# Reset score
def reset_game_score!(score)
  score['player'] = 0 && score['dealer'] = 0
end

def welcome
  prompt "Welcome to this game ! First to #{BUSTED_LIMIT} wins !"
  sleep 1.2
end

# play again question at the end of the game
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

# Calculate winner
def calculate_winner_round(player_cards, dealer_cards)
  player_total = calculate_total(player_cards)
  dealer_total = calculate_total(dealer_cards)

  if player_total > BUSTED_LIMIT
    return 'player busted', player_total, dealer_total
  elsif dealer_total > BUSTED_LIMIT
    return 'dealer busted', player_total, dealer_total
  elsif dealer_total < player_total
    return 'player', player_total, dealer_total
  elsif dealer_total > player_total
    return 'dealer', player_total, dealer_total
  else
    return 'tie', player_total, dealer_total
  end
end

# display winner
def display_winner_round(player_cards, dealer_cards, step)
  result = calculate_winner_round(player_cards, dealer_cards)[0]
  player_total = calculate_winner_round(player_cards, dealer_cards)[1]
  dealer_total = calculate_winner_round(player_cards, dealer_cards)[2]
  display_game(player_cards, dealer_cards, step)
  case result
  when 'dealer busted'
    prompt "Dealer busted ! You win #{player_total} - #{dealer_total}"
  when 'player busted'
    prompt "You busted ! Dealer wins #{dealer_total} - #{player_total}"
  when 'dealer'
    prompt "Dealer wins #{dealer_total} - #{player_total} !"
  when 'player'
    prompt "You win #{player_total} - #{dealer_total}"
  when 'tie'
    prompt "It's a tie! #{player_total} - #{dealer_total}"
  end
end

# increment score after each round
def increment_game_score!(player_cards, dealer_cards, score)
  winner = calculate_winner_round(player_cards, dealer_cards)
  case winner[0]
  when 'dealer busted' then score['player'] += 1
  when 'player busted' then score['dealer'] += 1
  when 'dealer' then score['dealer'] += 1
  when 'player' then score['player'] += 1
  end
end

total_score = { 'player' => 0, 'dealer' => 0 }
loop do
  welcome
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
      increment_game_score!(player_cards, dealer_cards, total_score)
      display_game_score(total_score)
      next
    end

    prompt "You chose to stay, let's see who'll win !"
    sleep 1.5

    dealer_hit_or_stay!(player_cards, dealer_cards, deck, step)
    display_winner_round(player_cards, dealer_cards, step)
    increment_game_score!(player_cards, dealer_cards, total_score)
    display_game_score(total_score)
  end

  reset_game_score!(total_score)
  break unless play_again?
end

prompt "Goodbye"
