
class Bst
  attr_accessor :data, :left, :right

  def initialize(value)
    @data = value
    @left = nil
    @right = nil
  end

  def insert(value)
    new = Bst.new(value)
    attribution(self, new)
  end

  def attribution(obj, new)
    if new.data <= obj.data
      obj.left.nil? ? obj.left = new : attribution(obj.left, new)
    else 
      obj.right.nil? ? obj.right = new : attribution(obj.right, new)
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
end





