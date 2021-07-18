
class Bst
  attr_accessor :data, :left, :right

  def initialize(value)
    @data = value
    @left = nil
    @right = nil
  end

  def insert(value)
    if value <= data
      left.nil? ? left = Bst.new : right.insert(value)
    else 
      right.nil? ? right = Bst.new : left.insert(value)
    end
  end

  end

  def each
    sorted = [] << self.data
    lookup(sorted, self)
    counter = 0
    while counter < sorted.size
      yield(sorted[counter]) if block_given?
      counter += 1
    end
    sorted.each
  end

  def lookup(sorted, obj)
    obj.left.nil? ? nil : (sorted.insert(sorted.index(obj.data),obj.left.data)) && lookup(sorted, obj.left)
    obj.right.nil? ? nil : (sorted.insert(sorted.index(obj.data)+1,obj.right.data)) && lookup(sorted, obj.right)
  end

  def test
    left
  end
end

four = Bst.new(4)
four.insert(2)
four.insert(5)
four.insert(3)

p four.test





