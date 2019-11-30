# def interleave(arr1, arr2)
#   new_arr = []
#   counter = 0
#   loop do
#     new_arr << arr1[counter] << arr2[counter]
#     counter += 1
#     break if counter == arr1.size
#   end
#   new_arr
# end

def interleave(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |value, index|
    new_arr << value << arr2[index]
  end
  new_arr
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']