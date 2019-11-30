ALPHA = { lowercase: [*'a'..'z'], uppercase: [*'A'..'Z']}

# def letter_case_count(string)
#   returned_hash = { lowercase: 0, uppercase: 0, neither: 0}
#   string.chars.each do |value|
#     case
#     when ALPHA[:lowercase].include?(value)
#       returned_hash[:lowercase] += 1
#     when ALPHA[:uppercase].include?(value)
#       returned_hash[:uppercase] += 1
#     else
#       returned_hash[:neither] += 1
#     end
#   end
#   returned_hash
# end

def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end





puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }