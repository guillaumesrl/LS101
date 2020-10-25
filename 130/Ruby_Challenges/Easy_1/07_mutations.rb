class DNA

  def initialize(original)
    @original_dna = original
  end

  def hamming_distance(new)
    distance = 0
    @original_dna.each_char.with_index do |acid, idx|
      distance += 1 if acid != new[idx]
      break if idx == new.size - 1
    end
    distance
  end
end

