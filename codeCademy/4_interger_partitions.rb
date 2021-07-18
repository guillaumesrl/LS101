

def enum(n, max = n)
  return [[]] if n == 0
  [max, n].min.downto(1).flat_map do |i|
      p "max is #{max}"
      enum(n-i, i).map{|rest| [i, *rest]}
  end
end


p enum(5)