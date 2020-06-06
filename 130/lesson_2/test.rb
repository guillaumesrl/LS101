
def rotate(arr)
  arr[1..] + [arr[0]]
end


def rotate_rightmost_digits(num, n)
  num_arr = num.to_s.chars
  (num_arr[0...-n] + rotate(num_arr[-n..]).join().to_i)
end



#p rotate_rightmost_digits(735291, 1) == 735291
#p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917