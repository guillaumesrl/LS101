=begin
Given a positive number n > 1 find the prime factor decomposition of n. The result will be a string with the following form :

 "(p1**n1)(p2**n2)...(pk**nk)"
where a ** b means a to the power of b

with the p(i) in increasing order and n(i) empty if n(i) is 1.

Example: n = 86240 should return "(2**5)(5)(7**2)(11)"
=end



## Use of Prime.prime_division >> 
# require 'prime'
# def prime_factors(n)
#   str = ''
#   factors = Prime.prime_division(n)
#   factors.each do |fac|
#     fac[1] == 1 ? str << "(#{fac[0]})" : str << "(#{fac[0]}**#{fac[1]})"
#    end
#   str
# end



def prime_factors(n)
  result = ''
  factors = {}
  number = n
  counter = 2
  while counter <= number
    if number % counter == 0
      number /= counter
      factors[counter] ? factors[counter] += 1 : factors[counter] = 1
    else
      counter += 1
    end
  end
  factors
  factors.each_pair do |key, value|
    result << (value == 1 ? "(#{key})" : "(#{key}**#{value})")
  end
  result 
end

p prime_factors(543534534544343534534)