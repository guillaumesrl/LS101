# ask the user for two numbers
# ask the user for the operator
# perform the operation
# output the result

def prompt(message)
  Kernel.puts("=>#{message}")
end


Kernel.puts("Welcome to the calculator")

Kernel.puts("Enter your first number")
number1 = Kernel.gets.chomp()

Kernel.puts("Enter your second number")
number2 = Kernel.gets.chomp()

Kernel.puts("What operation would you like du perform ? 1) add 2) subtract 3) multiply 4) devide")
operator = Kernel.gets.chomp()

if operator == '1'
  resultat = number1.to_i() + number2.to_i()
elsif operator == '2'
  resultat = number1.to_i() - number2.to_i()
elsif operator == '3'
  resultat = number1.to_i() * number2.to_i()
else 
  resultat = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is #{resultat}")
