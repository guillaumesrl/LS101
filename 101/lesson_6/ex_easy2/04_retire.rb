puts "What is your age ?"
age = gets.chomp.to_i

puts "At what age would you like to retire ?"
retire_age = gets.chomp.to_i
remaining_years = retire_age - age

current_year = Time.now.year
retirement_year = current_year + remaining_years

puts "We are in #{current_year} , you have to work #{remaining_years} to retire in #{retirement_year}"