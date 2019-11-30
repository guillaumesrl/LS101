def repeater(string)
  new_string = ''
  string.chars.each do |char|
    new_string << char*2
  end
  new_string
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''