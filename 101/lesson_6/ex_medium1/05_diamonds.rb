def diamonds(num)
  1.upto(num) { |n| display(n, num if n.even? )}
  (num+1).downto(1) { |n| display(n, num if n.even? )}
end

def display(n, num)
  stars = '*' * n
  puts "#{stars.center(num)}"
end


diamond(9)
