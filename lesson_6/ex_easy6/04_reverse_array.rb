def reverse(arr)
  counter_pos = 0
  counter_neg = -1
  loop do
    arr[counter_pos], arr[counter_neg] = arr[counter_neg], arr[counter_pos]
    counter_pos += 1
    counter_neg -= 1
    break if counter_pos == arr.size/2
  end
  p arr
  p arr.object_id
end

a = ['a','b','c']
p a.object_id
reverse(a)