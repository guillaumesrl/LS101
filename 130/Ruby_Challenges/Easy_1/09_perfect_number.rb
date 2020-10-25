class PerfectNumber

  def self.classify(num)
    raise RuntimeError if num < 0
    sum = (1...num).select { |el| num%el == 0}.sum
    case
    when sum == num then "perfect"
    when sum > num then "abundant"
    when sum < num then "deficient"
    end

  end

end