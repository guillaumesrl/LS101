=begin
character set = letters, space, point.
words = 1 or more letters, at max 20
text = 1 or more word separated from each other by one or more space and terminated by 0 or more spaces followed by a point.

the text should be read letter by letter, from the first letter to terminating point.
the outpout text must be produced such that successive words are separated by a single space with the last followed by a point
Odd words are copied in reverse order while odd ones are kept normal.



- chars: letter, space, point
- words: 1-20 letters
- input: 
  - 1 - * words
  - separated by 1 - * spaces
  - terminated by 0 - * spaces, followed by a point 

- output :
  - words: have the odd words reversed
  - separated by 1 space
  - terminated: 0 space, followedb y a point  


=end


class OddWords

  def initialize(sentence)
    @sentence = sentence
  end

  def odd_words_translation
    @result = ''
    @temp_word = ''
    @size = sentence.size
    counter = 0
    odd = false
    loop do
      if @sentence[counter] =~ /[a-zA-Z]/
        @temp_word << @sentence['counter']
        counter += 1
      elsif @sentence[counter] == 




def odd_words(sentence)
  sentence.gsub!(/\..*/, '')
  arr = sentence.split
  arr.map!.with_index do |word, idx|
    idx.odd? ? word.reverse : word
  end
  print arr.join(' ') + '.'
  puts
end


odd_words("coucou      je te  fais  .")
