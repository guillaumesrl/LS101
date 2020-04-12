def reverse(arr)
  reversed_arr = []
  arr.size.times {|index| reversed_arr.prepend(arr[index])}
  reversed_arr
end

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              
puts reverse([]) == []  