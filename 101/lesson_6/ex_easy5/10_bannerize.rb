def print_in_box(sentence)
  text_lenght = sentence.size
  puts '+' + '-'*(text_lenght+2) +'+'
  puts '|' + ' '*(text_lenght+2) +'|'
  puts "| #{sentence} |"
  puts '|' + ' '*(text_lenght+2) +'|'
  puts '+' + '-'*(text_lenght+2) +'+'
end

print_in_box("coucou c'est moi")
