class PhoneNumber
  attr_accessor :num

  def initialize(num)
    @num = num
  end

  def clean_number
    num.gsub!(/[^\w]/ , '')
    num
  end

  def number
    !self.clean_number.gsub!(/^1?([0-9]{10})$/, '\1' ) ? '0000000000' : num
  end

  def area_code
    num[0..2]
  end

  def to_s
    self.number
    "(#{self.area_code}) #{num[3...6]}-#{num[6..10]}"
  end
end

test =  PhoneNumber.new('11234567890')

p test.clean_number
p test.clean_number
p test.number


