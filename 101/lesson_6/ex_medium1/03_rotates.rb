def rotate_array(arr)
  arr[1..] + [arr[0]]
end

def rotate_rightmost_digits(num, n)
  num_string = num.to_s.chars
  num_string[-n..] = rotate_array(num_string[-n..])
  num_string.join.to_i
end

# def max_rotation(num)
#   num.to_s.size.downto(2) do |n|
#     num = rotate_rightmost_digits(num, n)
#   end
#   num
# end

def max_rotation(num)
  num_arr = num.to_s.chars
  counter = 0
  loop do
    num_arr[counter..-1] = rotate_array(num_arr[counter..-1])
    counter += 1
    break if counter > num_arr.size-1
  end
  num_arr.join.to_i
end



puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845