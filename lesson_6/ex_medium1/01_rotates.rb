# def rotate_array(arr)
#   new_arr = Array.new(arr.size)
#   arr.size.times do |index|
#     new_arr[index-1] = arr[index]
#   end
#   new_arr
# end

def rotate_array(arr)
  arr[1..] + [arr[0]]
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

p x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]
p x