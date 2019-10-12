statement = "The Flintstones Rock"

lettres = ('A'..'Z').to_a + ('a'..'z').to_a
lettres_occurences = {}

lettres.each do |lettre|
  frequence_lettre = statement.chars.count(lettre)
  lettres_occurences[lettre] = frequence_lettre if frequence_lettre > 0
end

p lettres_occurences
