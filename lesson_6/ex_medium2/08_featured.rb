def featured(num)
  return 'impossible' if num >= 1234567890
  loop do
    num += 1
    break if is_featured?(num)
  end
  num
end

def is_featured?(num)
  (num.odd? && (num % 7 == 0) && (num.to_s.chars.uniq.join.to_i == num))
end


puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987

puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements