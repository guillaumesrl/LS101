

class Series

  def initialize(string)
    @series = string.chars.map(&:to_i)
  end
  

  # def slices(num)
  #   raise ArgumentError if num > @series.size
  #   result, start, last = [], 0, num-1
  #   while last < @series.size
  #     result << [*@series[start..last]]
  #     start += 1
  #     last += 1
  #   end
  #   result
  # end

    
# class Series

#   def initialize(series)
#     @series = series.chars.map(&:to_i)
#   end

  def slices(n)
    raise ArgumentError, 'n is too big' if n > @series.size
    @series.each_cons(n).to_a
  end

#   def slices(n)
#     result = []
#     0.upto(@series.size-n) do |pos|
#       result << @series[pos...pos+n]
#     end
#     result
#   end

end
