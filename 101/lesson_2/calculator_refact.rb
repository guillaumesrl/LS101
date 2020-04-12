require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')



def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false
end

def operation_to_message(operator)
  case operator
  when '1'
    'adding'
  when '2'
    'subtracting'
  when '3'
    'multiplying'
  when '4'
    'deviding'
  end
end

number1 = ''
number2 = ''

prompt(MESSAGES["welcome"])

loop do
  loop do
    prompt("Enter your first number")
    number1 = Kernel.gets.chomp()
    if valid_number?(number1)
      break
    else
      prompt("Enter a valid number")
    end
  end

  loop do
    prompt("Enter your second number")
    number2 = Kernel.gets.chomp()
    if valid_number?(number2)
      break
    else
      prompt("Enter a valid number")
    end
  end

  operator_prompt = <<-MSG
  What operation would you like to perform ?
  1) add
  2) substract
  3) multiply
  4) devide
  MSG
  prompt(operator_prompt)
  operator = ''
  loop do
    operator = Kernel.gets.chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Choose 1,2,3 or 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  resultat =  case operator
              when '1'
                number1.to_i() + number2.to_i()
              when '2'
                number1.to_i() - number2.to_i()
              when '3'
                number1.to_i() * number2.to_i()
              when '4'
                number1.to_f() / number2.to_f()
              end

  prompt("The result is #{resultat}")
  prompt("Do you want to continue ? Y/N")
  decision = Kernel.gets.chomp()
  break unless decision.downcase.start_with?('y')
end

prompt("bye !")
