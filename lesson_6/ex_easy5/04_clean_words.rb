ALPHABET = [*('a'..'z'),*('A'..'Z')]

# def cleanup(sentence)
#   sentence.gsub(/[^a-zA-Z]/, ' ').squeeze(' ')
# end

def cleanup(sentence)
  clean = []
  sentence.chars.each do |char|
    if ALPHABET.include?(char)
      clean << char
    else
      clean << ' ' if clean.last != ' '
    end
  end
  clean.join()
end


puts cleanup("---what's my +*& line?") == ' what s my line '