def get_infos
  length, width = 0, 0
  puts "Enter the length of the room in meters :"
  length = gets.chomp.to_f
  puts "Enter the width of the room in meters :"
  width = gets.chomp.to_f
  return length, width
end

def calculate_surface(length, width)
  squarred_meters = length * width
  squarred_feet = squarred_meters * 10.7639
  return squarred_meters, squarred_feet
end

def display_surface(length, width)
  squarred_meters, squarred_feet = calculate_surface(length, width)
  puts "The area of the room is #{squarred_meters.round(2)} square meters (#{squarred_feet.round(2)})"
end

length, width = get_infos
display_surface(length, width)

