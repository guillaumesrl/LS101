require 'pry'

def test
  binding.pry
  [1,2,3].each {|num| return 'success' if num == 3}
  binding.pry
end

p test

