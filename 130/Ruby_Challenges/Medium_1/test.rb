class Person
  attr_accessor :last_name, :first_name
 
  def initialize(name)
    parse_name(name)
  end

  def name
    "#{first_name} #{last_name}".strip
  end

  def name=(name)
    parse_name(name)
  end

  private

  def parse_name(name)
    full_name = name.split
    @first_name = full_name.first
    @last_name = full_name.size > 1 ? full_name.last : ''
  end


end