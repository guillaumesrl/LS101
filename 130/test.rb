


def prime_factors(n)
  factors = {}
  number = n
  counter = 2
  while counter <= number
    if number % counter == 0
      number /= counter
      factors[counter] ? factors[counter] += 1 : factors[counter] = 1
    end
    counter += 1
  end
  factors
end


# def prime_factors(n)
#   hash = {}
#   p = 2
#   while p <= n
#     if n % p == 0
#       n /= p
#       if hash[p]
#         hash[p] += 1
#       else
#         hash[p] = 1
#       end
#     else
#       p += 1
#     end
#   end
#   hash
# end
#
hi

p prime_factors(7775460)