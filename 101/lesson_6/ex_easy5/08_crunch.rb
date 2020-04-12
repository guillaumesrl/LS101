def crunch(sentence)
  crunched = ''
  sentence.chars.each do |char|
    crunched << char if char != crunched[-1]
  end
  crunched
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''