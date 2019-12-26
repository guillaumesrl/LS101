cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.clone,
         :diamonds => cards.clone,
         :clubs    => cards.clone,
         :spades   => cards.clone }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  scores = remaining_cards.map do |card|
    score(card)
  end

  sum += scores.sum
end



sum2 = deck.values.flatten.sum { |card| score(card)}
sum3 = deck.values.flatten.reduce(0) { |sum, card| sum += score(card)}
sum4 = deck.values.reduce(0) do |sum, arr_values|
  score = arr_values.map { |card| score(card)}
  sum += score.reduce(:+)
end




puts sum 
puts sum2
puts sum3
puts sum4