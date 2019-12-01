def rotate_array(arr)
  arr[1..] + [arr[0]]
end


# def rotate_rightmost_digits(num, digits)
#   num_string = num.to_s.chars
#   left_part = num_string[0.. -1-digits]
#   right_part = num_string[-digits..]
#   right_part = rotate_array(right_part)
#   (left_part + right_part).join.to_i
# end

def rotate_rightmost_digits(num, n)
  num_string = num.to_s.chars
  num_string[-n..] = rotate_array(num_string[-n..])
  num_string.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917