class WordProblem
  attr_reader:order

  OPERATORS = {
    'plus' => :+,
    'minus' => :-,
    'multiplied' => :*,
    'divided' => :/
  }

  def initialize(operation)
    @order = extraction(operation)
  end

  def extraction(operation)
    operation.scan(/-?\d+|plus|minus|multiplied|divided/)
             .map! do |el| 
              el.to_i.to_s == el ? el.to_i : OPERATORS[el]
            end
  end

  def valid?
    order.size >= 3
  end

  def answer
    raise ArgumentError, 'Wrong Arguments' unless valid?
    result = order[0]
    counter = 1
    loop do
      result = result.send(order[counter], order[counter+1])
      counter += 2
      break if counter >= order.size
    end
    result
  end
end