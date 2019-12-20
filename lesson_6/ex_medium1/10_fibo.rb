# def fibonacci(n)
#   first, last = [1, 1]
#   3.upto(n) do 
#     first, last = [last, first + last]
#   end
#   last
# end

# def fibonacci_last(n)
#   fibo_result = fibonacci(n)
#   fibo_result.to_s[-1].to_i
# end

def fibonacci_last(n)
  last2 = [1, 1]
    3.upto(n) { last2 = [last2.last, (last2.first + last2.last)%10]}
  last2.last
end

1
1
2 1+(1+1)%10
3 1+(2+1)%10
4 2+(3+2)%10
5 3+()



p fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
p fibonacci_last(123456789) # -> 4
