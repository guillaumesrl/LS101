

class TextAnalyzer
  def process
    return unless block_given?
    file_obj = File.open("text.txt")
    yield(file_obj.read)
    file_obj.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraph with split" }
analyzer.process { |text| puts "#{text.scan(/\n\n/).size} #{'\n\n'} with count" }
analyzer.process { |text| puts "#{text.split("\n").size} lines with split" }
analyzer.process { |text| puts "#{text.count("\n")} #{'\n'} with count" }

