

colour = ["blue", "red", "yellow"]
adjective = ["lazy", "stinky", "bossy"]
noun = ["cat", "dog", "kid"]

File.open("madlibs.txt") do |file|
  file.each do |line|
    puts line % {:colour => colour.sample , :adjective => adjective.sample , :noun => noun.sample}
  end
end

