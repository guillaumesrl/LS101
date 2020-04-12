def swap_name(string)
  string.split.reverse.join(', ')
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'