
class Shelter

  attr_reader :adopted

  def initialize
    @adopted = {}
  end

  def adopt(owner_obj, animal_obj)
    owner_obj.add_pet(animal_obj)
    @adopted[owner_obj.name] ||= owner_obj
  end

  def print_adoptions
    @adopted.each_pair do |owner_name, owner_obj|
      puts "#{owner_name} has adopted the following pets :"
      owner_obj.print_pet
    end
  end

  def number_of_pets
    key = self
    @adopted[key].size
  end

end



class Owner

  attr_reader :name, :pets

  def initialize(name_owner)
    @name = name_owner
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def print_pet
    pets.each { |pet| puts pet}
  end

  def number_of_pets
    @pets.size
  end


end



class Pet

  attr_reader :animal, :name

  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
    "a #{animal} named #{name}"
  end
end




butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."






# =begin
# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
# =end
