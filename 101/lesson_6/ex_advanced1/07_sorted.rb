def merge(arr1, arr2)
  new_arr = []
  counter = 0
  arr1.each do |el1|
    while counter < arr2.size && arr2[counter] <= el1
      new_arr << arr2[counter]
      counter += 1
    end
    new_arr << el1
  end
  new_arr + arr2[counter..-1]
end


puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]