def center_of(string)
  center = string.size/2
  if string.size.odd?
    string[center]
  else
    string[center-1..center]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'
