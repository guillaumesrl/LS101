def balanced?(string)
  balance = 0
  string.chars.each do |char|
    balance += 1 if char =~ /\(/
    balance += -1 if char =~ /\)/
    break if balance < 0
  end
  balance == 0 ? true : false
end



puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false