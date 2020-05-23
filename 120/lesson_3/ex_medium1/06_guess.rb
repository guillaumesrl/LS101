

class Pet
end

class Fish < Pet
  def swim
    'true'
  end
end

class Mammals < Pet
  def jump
  end
end

class Dog < Mammals
  def speak
  end

  def swim
    'true'
  end
end

class Bulldog < Dog
  def swim
    'false'
  end
end

