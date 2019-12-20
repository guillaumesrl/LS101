def stars(num)
  mid = num / 2
  0.upto(mid-1) { |index| puts line(index, mid)}
  puts '*' * num
  (mid-1).downto(0) { |index| puts line(index, mid)}
end

def line(index, mid)
  block = " " * mid
  block[index] = '*'
  "#{block}*#{block.reverse}"
end
stars(30)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *


# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *


