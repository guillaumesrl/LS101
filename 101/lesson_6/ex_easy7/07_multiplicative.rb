def balanced?(str)
  count = 0
  str.each_char do |char|
    count += 1 if char == '('
    count -= 1 if char == ')'
    return false if (count > 2 || count < 0)
  end
  true
end




p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
