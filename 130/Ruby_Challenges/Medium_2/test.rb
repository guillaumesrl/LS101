class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(item)
    raise TypeError.new("Can only add Todo objects") unless item.class == Todo
    self.todos << item
  end

  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |todo| todo.done?}
  end

  def item_at(idx)
    todos.fetch(idx)
  end

  def mark_done_at(idx)
    item_at(idx).done!
  end

  def mark_undone_at(idx)
    item_at(idx).undone!
  end

  def done!
    todos.each { |item| item.done!}
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def to_s
    val = ''
    val << "---- Today's Todos ----\n"
    todos.each { |item| val << item.to_s+ '\n'}
    val
  end

  def each
    @todos.each { |todo| yield(todo) }
    self
  end

  def select
    result = TodoList.new(title)
    @todos.each { |todo| result << todo if yield(todo) }
    result
  end

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)


list.each do |todo|
  puts todo                   # calls Todo#to_s
end

p list.select { |todo| todo.done? }