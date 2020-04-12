def palindrome?(string)
  string.reverse == string && string.size > 1
end

def palindromes(string)
  substrings = []
  counter1 = 0
  counter2 = 0
  loop do
    current_sub = string[counter1..counter2]
    substrings << current_sub if palindrome?(current_sub)
    counter2 += 1
    (counter1 +=1) && (counter2 = counter1) if counter2 == string.size
    break if counter1 == string.size
  end
  substrings
end



puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]