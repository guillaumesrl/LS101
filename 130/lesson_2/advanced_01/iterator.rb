# each, map = internal iterator
# external iterators use Enumerator class

# create an Enumerator that can iterate over an infinite list of factorials. Once you make this new Enumerator, 
# test it out by printing out the first 7 factorial values, starting with zero factorial.

# More specifically, print the first 7 factorials by using an "External Iterator". Once you have done so, reset your Enumerator. 
# Finally, reprint those same 7 factorials using your Enumerator object as an "Internal Iterator".

factorials = Enumerator.new do |yielder|
  number = 0
  accumulator = 1
  loop do
    accumulator = number.zero? ? 1 : number * accumulator
    yielder << accumulator
    number += 1
  end
end

7.times { puts factorials.next }

factorials.rewind

factorials.each_with_index do |el, idx|
  puts el
  break if idx > 5
end


numbers = [1,2,3,4,5].cycle(3)

puts numbers.next
puts numbers.next
puts numbers.next
puts numbers.next
puts numbers.next
