
def duplicate_count(str)
  num_duplicate_char = 0
  str.chars.uniq.each { |char| num_duplicate_char += 1 if str.downcase.count(char) > 1}
  num_duplicate_char
end

p duplicate_count("") == 0
p duplicate_count("abcde") == 0
p duplicate_count("abcdeaa") == 1
p duplicate_count("abcdeaB") == 2
p duplicate_count("Indivisibilities") == 2