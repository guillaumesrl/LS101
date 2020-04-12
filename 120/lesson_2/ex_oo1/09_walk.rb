module Walk
  def walk
    puts "lets walk!"
  end
end


class Cat
  include Walk
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.walk