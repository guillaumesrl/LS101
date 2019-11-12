def count_occurrences(vehicles)
  vehicles.uniq.each {|el| puts "#{el} => #{vehicles.count(el)}"}
end



vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)