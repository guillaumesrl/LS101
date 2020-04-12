# def remove_vowels(arr)
#   arr.map { |word| word.chars.map {|char| char unless 'aeiouAEIOU'.include?(char)}.join}
# end

def remove_vowels(arr)
  arr.map { |word| word.delete('aeiouAEIOU')}
end


puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']