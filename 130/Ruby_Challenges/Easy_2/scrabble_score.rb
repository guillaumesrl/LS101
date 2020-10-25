

class Scrabble

  SCORE_TABLE = {
  "AEIOULNRST" => 1,
  "DG" => 2,
  "BCMP" => 3,
  "FHVWY" => 4,
  "K" => 5,
  "JX" => 8,
  "QZ" => 10

}

  def initialize(word)
    @word = word
  end

  def self.score(word)
    self.new(word).score
  end

  def score
    return 0 if @word.nil?
    total = 0
    SCORE_TABLE.each do |key, value|
      @word.each_char do |char|
        if char =~ /[#{key}]/i
          total += value
        end
      end
    end
    total
  end
end




