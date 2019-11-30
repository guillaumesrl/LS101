def show_multiplicative_average(arr)
  result = 1
  arr.each {|num| result *= num.to_f}
  result /= arr.size
  puts format('the result is %.3f', result)
end




show_multiplicative_average([2, 5, 7, 11, 13, 17])