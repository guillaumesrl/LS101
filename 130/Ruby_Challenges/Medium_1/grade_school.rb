

class School
  attr_reader :result

  def initialize
    @result = Hash.new { |hash, key| hash[key] = []}
  end

  def to_h
    result.each { |_, value| value.sort!}.sort.to_h
  end

  def add(name, grade)
    result[grade] << name
  end

  def grade(grade)
    result[grade]
  end

end