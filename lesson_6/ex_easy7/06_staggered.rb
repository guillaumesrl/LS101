def staggered_case(string)
  new_string = ""
  need_change = true
  string.chars.each do |char|
    if /[a-zA-Z]/ =~ char
      if need_change
        new_string << char.upcase
      else
        new_string << char.downcase
      end
      need_change = !need_change
    else
      new_string << char
    end
  end
  new_string
end




puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'