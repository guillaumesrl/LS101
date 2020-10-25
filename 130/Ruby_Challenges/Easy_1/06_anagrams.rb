class Anagram

  def initialize(word)
    @word = word.downcase
  end

  def match(ary)
    ary.select { |el| is_anagram?(el.downcase) }
  end

  def is_anagram?(el)
    @word.chars.sort == el.chars.sort && el != @word
  end
end