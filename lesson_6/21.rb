require 'io/console'

def prompt(message)
  puts "=> #{message}"
end

def continue_game
  prompt "Press any key to continue !"
  STDIN.getch
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

# Displays ALL card for player, and for dealer when player choose to stay
def display_all_cards(cards, player)
  line1 = ''
  line2 = ''
  line3 = ''
  line4 = ''
  line5 = ''
  counter = 0

  loop do
    line1 << "   _____ "
    line2 << "  |     |"
    line3 << "  |  #{cards[counter][0]}  |"
    line4 <<  if cards[counter][1].size < 2
              "  |  #{cards[counter][1]}  |"
              else
              "  |  #{cards[counter][1]} |"
              end
    line5 << "  |_____|"
    counter += 1
    break if counter == cards.size
  end

  puts "  #{player} cards are :"
  puts line1, line2, line3, line4, line5, ' '
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

# Displays the game for first round
def display_game(player_cards, dealer_cards, validity)
  system 'clear'
  display_one_card(dealer_cards, 'Dealer\'s')
  display_all_cards(player_cards, 'Your')
  prompt "Not a valid choice !" if validity == false
end

# First two cards for each player
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

# Return true if score > 21
def busted?(cards)
  calculate_score(cards) > 21
end


loop do
  prompt "Welcome to 21 ! First to 5 wins ! Ready ? "
  continue_game
  player_victories = 0
  dealer_victories = 0

  loop do
    player_cards = []
    dealer_cards = []
    deck = initialize_deck
    initial_cards(deck, player_cards, dealer_cards)
    answer = nil
    validity = nil

    # player plays until busted or stays
    loop do
      display_game(player_cards, dealer_cards, validity)
      prompt "Will you hit or stay ?"
      answer = gets.chomp.downcase
      new_card!(player_cards, deck) && validity = true if answer == 'hit'

      if answer == 'stay' || busted?(player_cards)
        break
      elsif !['hit', 'stay'].include?(answer)
        validity = false
      end
      system 'clear'
    end

    # displays all cards + score if busted
    if busted?(player_cards)
      system 'clear'
      display_all_cards(dealer_cards, 'dealer\'s')
      display_all_cards(player_cards, 'your')
      prompt "Busted ! You : #{calculate_score(player_cards)} / Dealer : #{calculate_score(dealer_cards)}"
      puts " "
      dealer_victories += 1
      prompt "Total Score - You : #{player_victories} - Dealer : #{dealer_victories}"
      break if dealer_victories == 5
      continue_game
      next
    else
      prompt "You chose to stay, let's see who'll win !"
      continue_game
    end

    loop do
      system 'clear'
      puts " "
      prompt "Dealer is playing !"
      display_all_cards(dealer_cards, 'dealer\'s')
      display_all_cards(player_cards, 'your')
      dealer_score = calculate_score(dealer_cards)
      if dealer_score < 17
        new_card!(dealer_cards, deck)
      else
        break
      end
      sleep 2
    end

    dealer_score = calculate_score(dealer_cards)
    player_score = calculate_score(player_cards)
    if player_score > dealer_score || dealer_score > 21
      prompt "Congratulations, you won ! You : #{player_score} / Dealer : #{dealer_score}"
      player_victories += 1
    else
      prompt "You lose ! You : #{player_score} / Dealer : #{dealer_score}"
      dealer_victories += 1
    end
    prompt "Total Score - You : #{player_victories} - Dealer : #{dealer_victories}"
    break if player_victories == 5 || dealer_victories == 5
    continue_game
  end

  prompt "You want to play again ? (y/n)"
  answer = gets.chomp.downcase
  break if answer.downcase == 'n'
end

prompt "See you soon"
