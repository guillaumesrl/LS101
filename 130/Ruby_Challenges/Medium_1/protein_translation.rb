class InvalidCodonError < StandardError
end

class Translation

  CODON = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA'	=> 'STOP',
  }

  def self.of_codon(str)
    CODON.keys.include?(str) ? CODON[str] : (raise InvalidCodonError)
  end

  def self.of_rna(str)
    arr = str.scan(/.{1,3}/).take_while { |codon| of_codon(codon) != 'STOP'}.map { |codon|  of_codon(codon) }
  end



end