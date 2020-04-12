puts "What is your name ?"
name = gets.chomp

if name[-1] == "!"
  name.chop!
  puts "Hello #{name}. WHY ARE YOU SCREAMING ?"
else
  puts "Hello #{name}"
end