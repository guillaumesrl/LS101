
def substrings(string)
  substrings = []
  counter1 = 0
  counter2 = 0
  loop do 
    substrings << string[counter1..counter2]
    counter2 += 1
    (counter1 +=1) && (counter2 = counter1) if counter2 == string.size
    break if counter1 == string.size
  end
  substrings
end



puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]