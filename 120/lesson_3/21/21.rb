# 21 is a two players card games. Using a 52 cards deck game, the goal is to be the closest to 21 without going over "bust".
# There is a dealer and a player, each of them are given 2 cards. The player can see its 2 cards but only one card from the dealer.

#Nouns: card, player, dealer, participant, deck, game, total
#Verbs: deal, hit, stay, busts

require 'io/console'

module Hand

  def display_all_cards
    lines = { line1: '', line2: '', line3: '', line4: '', line5: '' }
    generate_all_cards!(lines)
    puts "  #{self.class}'s cards are :"
    lines.each_value { |value| puts value }
    puts ''
  end
  
  # Generate all cards by modifying lines hash
  def generate_all_cards!(lines)
    counter = 0
    loop do
      lines[:line1] << "   _____ "
      lines[:line2] << "  |     |"
      lines[:line3] << "  |  #{cards[counter].family}  |"
      # Trick to handle the display of a two digit card (10)
      lines[:line4] << if cards[counter].value.size < 2
                         "  |  #{cards[counter].value}  |"
                       else
                         "  |  #{cards[counter].value} |"
                       end
      lines[:line5] << "  |_____|"
      counter += 1
      break if counter == cards.size
    end
  end

end

class Participant
  DEALER_LIMIT = 17
  BUSTED_LIMIT = 21
  include Hand

  def add_card(new_card)
    cards << new_card
  end

  def reset_cards
    self.cards = []
  end

  def total_hand
    total = 0
    values = cards.map { |card| card.value }
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

  def busted?
    total_hand > BUSTED_LIMIT
  end
  
end

class Player < Participant
  attr_accessor :cards, :total_score

  def initialize
    @cards = []
    @total_score = 0
  end
end

class Dealer < Participant
  attr_accessor :cards, :total_score

  def initialize
    @cards = []
    @total_score = 0
  end

  def display_one_card #(cards, player)
    line1 = "   _____    _____ "
    line2 = "  |     |  |     |"
    line3 = "  |  #{cards[0].family}  |  |  ?  |"
    # Trick to handle the display of a two digit card (10)
    line4 = if cards[0].value.size < 2
              "  |  #{cards[0].value}  |  |  ?  |"
            else
              "  |  #{cards[0].value} |  |  ?  |"
            end
    line5 = "  |_____|  |_____|"
  
    puts "  Dealer's cards are :"
    puts line1, line2, line3, line4, line5, ' '
  end
end



class Card
  attr_reader :family, :value
  FAMILIES = ['♠', '♥', '♦', '♣']
  FIGURES = ['A'] + [*'2'..'10'] + ['V', 'Q', 'K']

  def initialize(family, value)
    @family = family
    @value = value
  end

  

end


class Deck
  attr_reader :cards

  def initialize
    @cards = initialize_deck
  end

  def initialize_deck
    deck = []
    Card::FAMILIES.each do |family|
      Card::FIGURES.each do |value|
        deck << Card.new(family, value)
      end
    end
    deck.shuffle
  end

  def deal_one_card
    cards.pop
  end

end

class Game
  MAX_SCORE = 5


  attr_accessor :deck, :player, :dealer, :step

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
    @step = 1
  end

  def start
    reset_total_score

    loop do
      display_welcome_message
      while player_dealer_under_5
        # INITIALIZE DECK MISSING
        @step = 1
        reset_cards

        deal_initial_cards
        player_hit_or_stay!
        @step = 2

        if player.busted?
          display_winner_round
          increment_game_score!
          display_game_score
          next
        end

        prompt "You chose to stay, let's see who'll win !"
        sleep 1.5

        dealer_hit_or_stay!
        display_winner_round
        increment_game_score!
        display_game_score
      end

      reset_game_score!
      break unless play_again?
    end


    display_goodbye_message
  end

  def continue_game
    prompt "Press any key to continue !"
    STDIN.getch
  end

  def prompt(message)
    puts "=> #{message}"
  end

  def player_dealer_under_5
    player.total_score < 5 && dealer.total_score < 5
  end

  def display_welcome_message
    prompt "Welcome to this game ! First to #{Participant::BUSTED_LIMIT} wins !"
    sleep 1.2
  end

  def display_goodbye_message
    puts "Goodbye, thank you for playing"
  end

  def deal_initial_cards
    2.times do
      player.add_card(deck.deal_one_card)
      dealer.add_card(deck.deal_one_card)
    end
  end

  def show_initial_cards
    dealer.display_one_card
    player.display_all_cards
  end

  def reset_total_score
    dealer.total_score = 0
    player.total_score = 0
  end

  def reset_cards
    player.reset_cards
    dealer.reset_cards
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

  def display_game(phrase = nil)
    case step
    when 1
      system 'clear'
      puts " "
      dealer.display_one_card
      player.display_all_cards
    when 2
      system 'clear'
      display_phrase(phrase)
      dealer.display_all_cards
      player.display_all_cards
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
  
  # Player hit/stay : 1) display game 2) check input 3) new card or break
  def player_hit_or_stay!
    loop do
      display_game
      prompt "Will you (h)it or (s)tay ?"
      answer = valid_hit_or_stay
      player.add_card(deck.deal_one_card) if answer == 'h'
      if answer == 's' || player.busted?
        break
      end
    end
  end

  def dealer_hit_or_stay!
    phrase = 'dealer is playing'
    loop do
      system 'clear'
      puts " "
      prompt "Dealer is playing !"
      display_game(phrase)
      #dealer_score = calculate_total(dealer_cards)
      if dealer.total_hand < Participant::DEALER_LIMIT
        dealer.add_card(deck.deal_one_card)
      else
        sleep 1.5
        break
      end
      sleep 1.5
    end
  end

  def calculate_winner_round
    if player.total_hand > Participant::BUSTED_LIMIT
      return 'player busted', player.total_hand, dealer.total_hand
    elsif dealer.total_hand > Participant::BUSTED_LIMIT
      return 'dealer busted', player.total_hand, dealer.total_hand
    elsif dealer.total_hand < player.total_hand
      return 'player', player.total_hand, dealer.total_hand
    elsif dealer.total_hand > player.total_hand
      return 'dealer', player.total_hand, dealer.total_hand
    else
      return 'tie', player.total_hand, dealer.total_hand
    end
  end


  def display_winner_round
    result = calculate_winner_round[0]
    display_game
    case result
    when 'dealer busted'
      prompt "Dealer busted ! You win #{player.total_hand} - #{dealer.total_hand}"
    when 'player busted'
      prompt "You busted ! Dealer wins #{dealer.total_hand} - #{player.total_hand}"
    when 'dealer'
      prompt "Dealer wins #{dealer.total_hand} - #{player.total_hand} !"
    when 'player'
      prompt "You win #{player.total_hand} - #{dealer.total_hand}"
    when 'tie'
      prompt "It's a tie! #{player.total_hand} - #{dealer.total_hand}"
    end
  end

  def increment_game_score!
    winner = calculate_winner_round
    case winner[0]
    when 'dealer busted' then player.total_score += 1
    when 'player busted' then dealer.total_score += 1
    when 'dealer' then dealer.total_score += 1
    when 'player' then player.total_score += 1
    end
  end

  def winner_game?
    if player.total_score == MAX_SCORE
      'player'
    elsif dealer.total_score == MAX_SCORE
      'dealer'
    else
      'no'
    end
  end

  def display_game_score
    winner_game = winner_game?
    case winner_game
    when 'player'
      prompt "You won this game #{player.total_score} - #{dealer.total_score} !"
    when 'dealer'
      prompt "Dealer won this game #{dealer.total_score} - #{player.total_score} ! "
    when 'no'
      prompt "Game score : You #{player.total_score} , Dealer : #{dealer.total_score}"
    end
    puts ''
    continue_game
  end

  def reset_game_score!
    player.total_score = 0 && dealer.total_score = 0
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


end

Game.new.start