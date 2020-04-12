def fizzbuzz?(num)
  case
  when num % 5 == 0 && num % 3 == 0
    "FizzBuzz"
  when num % 5 == 0
    "Buzz"
  when num % 3 == 0
    "Fizz"
  else
    num
  end
end

def fizzbuzz(first, last)
  fizz_arr = []
  first.upto(last) do |num|
    fizz_arr << fizzbuzz?(num)
  end
  fizz_arr.join(', ')
end





puts fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz