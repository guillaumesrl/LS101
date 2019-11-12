def solve(s)
  note = {}
  voyels = 'aeiou'
  [*'a'..'z'].each do |letter|
    note[letter] = [*'a'..'z'].index(letter)+1
  end
  s = s.downcase.gsub(/[aeiouy]/, ' ').split(" ")
  s.map! do |el|
    el.chars.map! do |el|
      el = note[el]
    end
  end.map! { |el| el.sum }.sort!.last
end
text = 'zzattttooouuuaaawwwwwwwww'


p solve(text)

