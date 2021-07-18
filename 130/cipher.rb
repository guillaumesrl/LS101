class Cipher
  ALPHABET = ('a'..'z').to_a

  def self.encode(str)
    str.gsub(/\W/, '').chars.map do |char|
      if char.match?(/[a-z]/i)
        ALPHABET[- ALPHABET.index(char.downcase) - 1]
      else
        char
      end
    end.join.gsub(/(.{5})/, '\1 ').strip
  end
end