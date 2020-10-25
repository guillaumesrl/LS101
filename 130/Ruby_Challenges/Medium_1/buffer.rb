


class CircularBuffer

  attr_reader :buffer

  def initialize(size)
    @buffer = []
    @limit = size
  end

  def read
    @buffer.empty? ? (raise BufferEmptyException) : @buffer.shift
  end

  def write(str)
    self.modify(str) { raise BufferFullException }
  end

  def write!(str)
    self.modify(str) { @buffer.shift }
  end

  def modify(str)
    return if str.nil?
    yield if @buffer.size == @limit
    @buffer << str
  end

  def clear
    @buffer = []
  end

  class BufferEmptyException < StandardError
  end

  class BufferFullException < StandardError
  end
end

buffer = CircularBuffer.new(5)