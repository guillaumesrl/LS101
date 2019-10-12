#map version

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |word|
  word[0..2]
end

p flintstones
