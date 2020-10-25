class BeerSong

  def initialize
    @verse_correspondance = Hash.new(:verse_default).merge({ 0 => :verse_0, 1 => :verse_1, 2 => :verse_2 })
  end

  def verse(number)
    method = @verse_correspondance[number]
    result = send(method, number)
    return result
  end

  def verses(num1, num2)
    (num2..num1).map { |el| verse(el) }.reverse.join("\n")
  end

  def verse_default(num)
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num-1} bottles of beer on the wall.\n"
  end


  def verse_2(_)
    "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
  end

  def verse_1(_)
    "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end

  def verse_0(_)
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end

  def lyrics
    result_text = verses(99, 0)
  end
end




