

class PigLatin
  def self.translate(sentence)
    sentence.split.map { |word| adapt(word)}.join(' ')
  end

  def self.adapt(word)
    word.match(/^([aeiou]|[xy][^aeiou])/i) ?
      word.gsub(/^(\w)(\w*)/, '\1\2ay' ) :
      word.gsub(/^(.?qu|[^aeiou]+)(\w*)/, '\2\1ay' )
  end


end

p PigLatin.translate('alut alut')
