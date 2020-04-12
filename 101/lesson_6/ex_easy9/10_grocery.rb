def buy_fruit(arr)
  arr.map do |fruit, quantity|
    [fruit] * quantity
  end.flatten
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
["apples", "apples", "apples", "orange", "bananas","bananas"]