def reverse_words(str)
  str.split.map! do |word|
    if word.length < 5
      word
    else
      word.reverse
    end
  end.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS