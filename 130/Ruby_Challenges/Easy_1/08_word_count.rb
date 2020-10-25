class Phrase

  def initialize(sentence)
    @sentence = sentence.downcase.scan(/\b[\w']+\b/)
  end

  def word_count
    p @sentence
    count = Hash.new(0)
    @sentence.each do |el|
      count[el] += 1
    end
    count
  end
end

Phrase.new("coucou ca va c'est moi").word_count