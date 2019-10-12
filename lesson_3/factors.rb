def factors(number)
  divisor = number
  factors = []
  begin
    factors << number / divisor if number % divisor == 0
    divisor -= 1
    rescue ZeroDivisionError
    puts "Votre nombre doit être > 0"
  end until divisor == 0
  factors
end

puts factors(0)