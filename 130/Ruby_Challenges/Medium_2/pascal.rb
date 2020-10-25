

class Triangle

  def initialize(size)
    @size = size
  end


  def rows
    result = [[1]]
    (@size-1).times do |time|
      result << [1, result.last.each_cons(2).map(&:sum), 1].flatten
    end
    result
  end

end

test = Triangle.new(20)

p test.rows

