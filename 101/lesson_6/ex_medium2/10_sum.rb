def sum_square_difference(num)
  collec = (1..num).to_a
  collec.sum**2 - collec.map {|el| el**2 }.sum
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150