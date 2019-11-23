puts "What is the bill ?"
bill = gets.chomp.to_f
puts "What is the tip percentage ?"
rate = gets.chomp.to_f
tip = bill * rate / 100
puts "the tip is $#{(tip.round(2))}"
puts "the total price is $#{(tip+bill).round(2)} "

