class RunLengthEncoding

  # def self.encode(input)
  #   input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0]}
  # end
      

  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end

  def self.encode(input)
    counter = 1
    (0..(input.size-1)).each_with_object('') do |idx, result|
      if input[idx] == input[idx+1]
        counter += 1
      else
        result << (counter > 1 ? "#{counter}#{input[counter]}" : input[idx])
        counter = 1
      end
    end
  end

end


p RunLengthEncoding.encode('DAA')