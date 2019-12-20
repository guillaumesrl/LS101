def longest(string)
  arr = string.split(/([!.?])/)
  longest_string = arr.max_by { |sentence| sentence.split.size }
  longest_string = longest_string.strip + arr[arr.index(longest_string)+1]
  longest_size = longest_string.split.size
  puts "#{longest_string}"
  puts "#{longest_size}"

end

sentence = File.read('pg84.txt')
longest(sentence)