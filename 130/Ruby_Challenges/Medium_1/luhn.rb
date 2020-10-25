


class Luhn



  def initialize(num)
    @number = num
  end

  def multiply(el)
    (el * 2 >= 10) ? el * 2 - 9 : el * 2
  end

  def addends
    @number.digits.map.with_index do |el, idx|
      idx.odd? ? multiply(el) : el
    end.reverse
  end

  def checksum
    self.addends.sum
  end

  def valid?
    self.checksum.digits.first.zero?
  end

  def self.create(num)
    remainder = new(num * 10).checksum % 10
    num * 10 + (remainder.zero? ? 0 : 10 - remainder)
  end

end

test = Luhn.new(8739567)

p test.addends
p test.checksum
p test.valid?
