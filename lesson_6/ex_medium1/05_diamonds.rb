def print_line(size, index)
  stars = '*' * index
  puts stars.center(size)
end


def diamond(size)
  1.upto(size) do |index|
    print_line(size, index) if index.odd?
  end
  (size-1).downto(1) do |index|
    print_line(size, index) if index.odd?
  end
end





diamond(9)