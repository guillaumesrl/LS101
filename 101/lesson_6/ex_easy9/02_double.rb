def twice(num)
  num_s = num.to_s
  mid = num_s.size/2
  if num_s[0...mid] == num_s[mid..]
    num
  else
    num*2
  end
end




puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10