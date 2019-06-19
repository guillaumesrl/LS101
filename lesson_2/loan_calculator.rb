require 'yaml'
MESSAGE = YAML.load_file('loan_mess.yml')

def prompt(message)
  puts "=>#{message}"
end

def mpr(apr)
  ((1+ apr.to_f/100)**(1/12.to_f) -1)*100
end

def months(duration)
  duration.to_i * 12
end

def monthly(amount, mpr, months)
  amount.to_i * (mpr/100 / (1-(1+mpr/100)**(-months)))
end

def valid_number?(number)
  (integer?(number) || float?(number)) && number.to_f > 0
end

def integer?(number)
  Integer(number) rescue false
end

def float?(number)
  Float(number) rescue false
end

loop do
  prompt(MESSAGE["welcome"])
  amount = ''
  loop do
    prompt(MESSAGE["amount"])
    amount = gets.chomp
    if valid_number?(amount)
      break
    else
      prompt(MESSAGE["valid_number"])
    end
  end

  apr = ''
  mpr = ''

  loop do
    prompt(MESSAGE["apr"])
    apr = gets.chomp
    if valid_number?(apr)
      mpr = mpr(apr)
      break
    else
      prompt(MESSAGE["valid_number"])
    end
  end

  duration = ''
  months = ''

  loop do
    prompt(MESSAGE["duration"])
    duration = gets.chomp
    if valid_number?(duration)
      months = months(duration)
      break
    else
      prompt(MESSAGE["valid_number"])
    end
  end

  prompt("your monthly payment will be #{format('%02.2f' ,monthly(amount, mpr, months))}$")
  prompt(MESSAGE["continue"])
  decision = gets.chomp
  break if decision.downcase == 'n'
end
