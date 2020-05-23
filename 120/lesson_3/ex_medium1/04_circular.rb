class CircularQueue
  attr_accessor :buffer

  def initialize(size)
    @buffer = Array.new(size)
  end

  def dequeue
    return nil if buffer.empty?
    buffer.pop
  end

  def enqueue(obj)
    buffer.pop if full?
    buffer.unshift(obj)
  end

  def empty?
    buffer.all?(nil)
  end

  def full?
    buffer.none?(nil)
  end
end




queue = CircularQueue.new(3)
puts queue.dequeue == nil
queue.enqueue(1) # [1, nil, nil]
queue.enqueue(2) # [1, 2, nil]

puts queue.dequeue == 1 #[nil, 2, nil]

queue.enqueue(3)
queue.enqueue(4)

puts queue.dequeue == 2


queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)

puts queue.dequeue == 5

puts queue.dequeue == 6
puts queue.dequeue == 7

puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil
