

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
    @octal_num.chars.map(&:to_i).reverse.each_with_index do |num, index|
      result += num*8**index
    end
    result
  end
end

# class Octal

#   def initialize(octal)
#     @octal = octal.chars
#   end

#   def to_decimal
#     return 0 if unvalid
#     result = 0
#     @octal.reverse.each_with_index do |num, idx|
#       result += num.to_i * 8**idx
#     end
#     result
#   end

#   def unvalid
#     @octal.any? { |el| el =~ /[^0-7]/ }
#   end

# end