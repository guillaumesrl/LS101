class SumOfMultiples

  def initialize(mul1 = 3, mul2 = 5, *muls)
    @multiples = [mul1, mul2, *muls]
  end

  def self.to(ending_num)
    self.new.calculate_multiples(ending_num)

  end

  def to(ending_num)
    calculate_multiples(ending_num)
  end

  def calculate_multiples(ending_num)
    (1...ending_num).select { |num| @multiples.any? { |mul| num%mul == 0} }
                    .sum
  end
end

p SumOfMultiples.new(3,4,5).to(30)
