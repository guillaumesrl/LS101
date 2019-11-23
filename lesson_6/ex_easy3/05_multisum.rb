def multiple?(num, divisor)
  num%divisor == 0
end

def multisum(num)
  sum = 0
  for i in (1..num)
    sum += i if multiple?(i, 3) || multiple?(i, 5)
  end
  sum
end

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168