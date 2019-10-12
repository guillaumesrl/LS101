#loop do end version

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh = {}
counter = 0

loop do
  break if counter == flintstones.size
  hsh[flintstones[counter]] = counter
  counter += 1
end

p hsh

#each_with_index version
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
hsh2 = {}

flintstones.each_with_index do |value, index|
  hsh2[value] = index
end
p hsh2

