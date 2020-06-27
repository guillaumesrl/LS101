enum = Enumerator.new do |yielder|
  n = 0
  loop do
    yielder << n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n*n
    n += 1
  end
end
  
loop do
  puts enum.next
end
