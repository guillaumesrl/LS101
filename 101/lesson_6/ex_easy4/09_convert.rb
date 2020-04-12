STRING_DIGITS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(num)
  string = ''
  number = 0
  loop do
    num, remainder = num.divmod(10)
    string.prepend(STRING_DIGITS[remainder])
    break if num == 0
  end
  string
end

def signed_integer_to_string(num)
  case
  when num > 0
    integer_to_string(num).prepend('+')
  when num < 0
    integer_to_string(-num).prepend('-')
  else
    integer_to_string(num)
  end
end


puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
