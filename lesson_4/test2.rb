number_of_pets = {
  'dogs' => 2,
  'cats' => 4,
  'fish' => 1
}

keys_hsh = number_of_pets.keys
counter = 0

loop do
  break if counter == keys_hsh.size
  puts "j'ai #{number_of_pets[keys_hsh[counter]]} #{keys_hsh[counter]}"
  counter += 1
end