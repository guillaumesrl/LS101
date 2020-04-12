def substrings_at_start1(string)
  substrings = []
  string.size.times do |index|
    substrings << string[0..index]
  end
  substrings
end

def substrings_at_start(string)
  substrings = []
  1.upto(string.size) do |count|
    substrings << string.slice(0,count)
  end
  substrings
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']