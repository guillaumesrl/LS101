


def each_with_index(array)
  counter = 0
  while counter < array.size
    yield(array[counter], counter)
    counter += 1
  end
  array
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]