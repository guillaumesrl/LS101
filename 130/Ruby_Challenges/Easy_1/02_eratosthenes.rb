class Sieve

  def initialize(num)
    @arr = (2..num).to_a
  end

  def primes
    @arr.each do |num|
      @arr.delete_if { |el| el > num && el%num == 0}
    end
    p @arr
  end
end

Sieve.new(1000).primes

      