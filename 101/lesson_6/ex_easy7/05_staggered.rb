def staggered_case(string)
  new_string = ''
  string.chars.each_with_index do |char, index|
    new_string << char.upcase if index.even?
    new_string << char.downcase if index.odd?
  end
  new_string
end


puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'