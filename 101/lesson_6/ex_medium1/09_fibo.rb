# def fibonacci(n)
#   fib = [1, 1]
#   3.upto(n) { fib << fib[-2] + fib[-1] }
#   fib.last
# end

def fibonacci(n)
  first, last = [1, 1]
    3.upto(n) { first, last = [last, first+last]}
  last
end


puts fibonacci(20) == 6765
