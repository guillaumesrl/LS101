class Element
  attr_accessor :datum, :next

  def initialize(value, next_el= nil)
    @datum = value
    @next = next_el
  end

  def tail?
    @next.nil?
  end

end

class SimpleLinkedList
  attr_reader :list

  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    @list.empty?
  end

  def push(value)
    new_el = Element.new(value, self.head)
    @list << new_el
  end

  def peek
    @list.empty? ? nil : head.datum
    
  end

  def to_a
    @list.map(&:datum).reverse
  end

  def head
    @list.last
  end

  def pop
    @list.pop.datum
  end

  def self.from_a(col)
    new_list = self.new
    col.nil? ? (return new_list) : col.reverse.each { |el| new_list.push(el)}
    new_list
  end

  def reverse
    inter = @list
    @list = []
    inter.map(&:datum).reverse.each { |el| push(el) }
    self
  end



end






