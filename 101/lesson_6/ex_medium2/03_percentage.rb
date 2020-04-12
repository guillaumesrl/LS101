def letter_percentages(string)
  hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  percentages = { lowercase: 0, uppercase: 0, neither: 0 }
  string_arr = string.chars
  string_size = string.size
  hsh[:uppercase] = string_arr.count { |char| char =~ /[A-Z]/ }
  hsh[:lowercase] = string_arr.count { |char| char =~ /[a-z]/ }
  hsh[:neither] = string_arr.count { |char| char =~ /[^a-z]/i }
  
  calculate_percentage(percentages, hsh, string_size)
end

def calculate_percentage(percentages, hsh, string_size)
  percentages[:lowercase] = (hsh[:lowercase].to_f * 100) / string_size
  percentages[:uppercase] = (hsh[:uppercase].to_f * 100) / string_size
  percentages[:neither] = (hsh[:neither].to_f * 100) / string_size
  percentages
end


puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }