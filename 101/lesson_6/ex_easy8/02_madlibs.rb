puts "enter a Noun :"
noun = gets.chomp
puts "enter a verb :"
verb = gets.chomp
puts "enter an adjective :"
adjective = gets.chomp
puts "enter an adverb :"
adverb = gets.chomp

sentence_1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence_2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence_3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle."

puts [sentence_1, sentence_2, sentence_3].sample