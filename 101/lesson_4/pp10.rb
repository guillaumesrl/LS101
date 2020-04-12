munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name ,details|
  if details['age'] < 17
    details["age_group"] = 'kid'
  elsif details['age'] < 64
    details["age_group"] = 'adult'
  else
    details["age_group"] = 'senior'
  end
end

p munsters

# a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.