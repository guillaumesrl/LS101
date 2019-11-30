
def find_fibonacci_index_by_length(num)
  fib = [1, 1]
  while fib.last.to_s.size != num
    fib << fib[-2] + fib[-1]
  end
  fib.size
end


puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847