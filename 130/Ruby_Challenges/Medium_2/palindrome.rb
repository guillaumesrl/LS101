class Palindromes
  attr_reader :max, :min, :palindromes

  def initialize(arg = {})
    @max = arg[:max_factor] || 1
    @min = arg[:min_factor] || 1
  end

  def generate
    @palindromes = (min..max).to_a
                             .repeated_combination(2)
                             .to_a
                             .select { |combi| is_palindrome?(combi)}
                             .sort_by { |combi| combi.reduce(:*)}
  end

  def is_palindrome?(arr)
    arr.reduce(:*).digits == arr.reduce(:*).digits.reverse
  end

  def largest
    largest_pal = palindromes.last.reduce(:*)
    factors = palindromes.select { |combi| combi.reduce(:*) == largest_pal }
    Palindrome.new(largest_pal, factors)
  end

  def smallest
    smallest_pal = palindromes.first.reduce(:*)
    factors = palindromes.select { |combi| combi.reduce(:*) == smallest_pal}
    Palindrome.new(smallest_pal, factors)
  end
end

class Palindrome
  attr_reader :value, :factors 

  def initialize(value, palindromes)
    @value = value
    @factors = palindromes
  end
end
