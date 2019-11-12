def is_odd?(num)
  num % 2 > 0
end

def is_odd2?(num)
  num.remainder(2) != 0
end

puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true