class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def self.generic_greeting
    puts "hello im a cat"
  end

  def personal_greeting
    puts "Hello my name is #{self.name}"
  end

end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting