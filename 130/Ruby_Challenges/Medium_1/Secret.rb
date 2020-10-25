
=begin
class SecretHandshake

  CODE = ['wink', 'double blink', 'close your eyes', 'jump']

  def initialize(num)
    @binary_arr = num.to_i.to_s(2).chars.reverse
  end

  def commands
    result = @binary_arr.map.with_index { |val, idx| CODE[idx] if val == '1'} - [nil]
    @binary_arr.size >= 5 ? result.reverse : result
  end
end

=end

class SecretHandshake
  CODE = {
    1 => 'wink',
    10 => 'double blink',
    100 => 'close your eyes',
    1000 => 'jump'
  }

  def initialize(num)
    @binary = num.to_i.to_s(2).to_i
  end

  def commands
    result = []
    soustractor = 1
    reverse = true if @binary >= 10000
    while @binary > 0
      soustractor_size = soustractor.to_s.size
      if @binary.to_s[-soustractor_size..] == soustractor.to_s
        @binary -= soustractor
        result << CODE[soustractor]
      else
        soustractor *= 10
      end
    end
    (reverse ? result.reverse : result) - [nil]
  end
end





