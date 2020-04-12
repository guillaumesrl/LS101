CONSONNES = %w(b c d f g h j k l m n p q r s t v w x y z)

def double_consonants(string)
  new_string = ''
  string.chars.each do |char|
    new_string << char if CONSONNES.include?(char.downcase)
    new_string << char
  end
  p new_string
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""