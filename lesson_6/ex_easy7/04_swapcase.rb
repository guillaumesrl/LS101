MAJ = [*'A'..'Z']
MIN = [*'a'..'z']

def swapcase(string)
  arr = string.chars
  arr.map do |char|
    if char =~ /[A-Z]/
       char.downcase
    elsif char =~ /[a-z]/
      char.upcase
    else
      char
    end
  end.join
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'