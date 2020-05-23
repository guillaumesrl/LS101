def reduce(collection)
  acc = ''
  counter = 0
  while counter < collection.size
    acc = yield(acc, collection[counter])
    counter += 1
  end
  acc
end


a = [1,2,'a']

p reduce([[1,2], ['a','b']]) { |acc, el| acc + el.to_s}