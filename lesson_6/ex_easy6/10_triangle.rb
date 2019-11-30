def triangle(num)
  counter = 1
  loop do
    puts ' '*(num-counter) + '*'*counter
    counter +=1
    break if counter > num
  end
end

triangle(1500)
