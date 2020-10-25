class Diamond

  def self.make_diamond(letter)
    result = [*'A'..letter]
    result.map!.with_index do |l, idx|
      ext = " " * (result.size - idx - 1)
      int = " " * (1 + ((idx-1) * 2)) if idx > 0
      idx.zero? ? (ext + l + ext) : (ext + l + int + l + ext)
    end

    (result + result[0..-2].reverse).join("\n") + "\n"


  end



end

