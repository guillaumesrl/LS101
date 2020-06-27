# def divisors(num)
#   (1..num).select { |el| num%el == 0 }
# end


def divisors(n)
  result = []
  1.upto(Math.sqrt(n).ceil).each do |divisor|
    result << n / divisor << divisor if n % divisor == 0
  end
  result.sort.uniq
end



p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute