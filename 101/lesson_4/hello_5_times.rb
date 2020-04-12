say_hello = true
iteration = 1

while say_hello
  puts 'Hello!'
  iteration +=1
  say_hello = false if iteration > 5
end