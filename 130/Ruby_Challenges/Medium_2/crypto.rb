class Crypto
  attr_reader :message, :normalize_plaintext

  def initialize(message)
    @message = message
    @normalize_plaintext = message.downcase.gsub(/\W/, '')
  end

  def size
    column_size = normalize_plaintext.size
    Math.sqrt(column_size).ceil
  end

  def plaintext_segments
    normalize_plaintext.split('').each_slice(size).map { |arr| arr.join()}
  end

  def ciphertext
    normalize_ciphertext.gsub(/ /, '')
  end

  def normalize_ciphertext
    plaintext_segments.map(&:chars).reduce(&:zip).map(&:join).join(' ')
  end
end

c = Crypto.new('Time is an illusion. Lunchtime doubly so.')

p c.plaintext_segments
p c.ciphertext



