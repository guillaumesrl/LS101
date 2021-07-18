

class Trinary

  CONS = 3

  def initialize(num)
    @trinary_num = num
  end

  def to_decimal
    @trinary_num =~ /[^0-2]/ ? 0 : calculate
  end

  def calculate
    result = 0
    @trinary_num.chars.reverse.each_with_index do |num, index|
      result += num.to_i*CONS**index
    end
    result
  end
end

p Trinary.new('183').to_decimal

# class Trinary

#   def initialize(str)
#     @trinary = str
#   end

#   def to_decimal
#     @trinary =~ /[^0-2]/ ? 0 : calculate
#   end

#   def calculate
#     @trinary.chars.reverse.map(&:to_i).each_with_index.map {|num, idx| num*3**idx }.sum
#   end
# end
