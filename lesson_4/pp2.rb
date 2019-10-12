#each_value version
total_age = 0
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.each_value do |age|
  total_age += age
end

p total_age

#each version
total_age2 = 0
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.each do |name,age|
  total_age2 += age
end

p total_age2
