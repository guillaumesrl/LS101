

class Octal
  attr_reader :octal_num

  def initialize(num)
    @octal_num = num
  end

  def to_decimal
    @octal_num =~ /\D|[8-9]/ ? 0 : calculate
  end

  def calculate
    result = 0
    @octal_num.chars.reverse.each_with_index do |num, index|
      result += num.to_i*8**index
    end
    result
  end
end

p Octal.new('183').to_decimal