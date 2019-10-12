# PROBLEM:

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

#INPUT : String
#OUTPUT : Array of substrings

#RULES : 
# Palindromes are case sensitives
# If nos palindrome we return an empty array
# There can be several palindromes in a word = substrings
# bonjour => ['bo','bon','bonj','bonjo','bonjou','bonjour','on','onj...]

#Algo :
#
# enter the loop
#
#
#
#
#
#


def substring(str)

  resultat = []
  index_start = 0
  index_end = index_start + 1

  loop do
    break if index_start == str.size
    loop do
      break if index_end == str.size
      resultat << str[index_start..index_end]
      index_end +=1
    end
    index_start += 1
    index_end = index_start + 1
  end
  return resultat
end

def palindromes(str)
  resultat = substring(str)
  palindromes_arr = []
  counter = 0
  loop do
    break if counter == resultat.size
    palindromes_arr << resultat[counter] if resultat[counter] == resultat[counter].reverse
    counter += 1
  end
  return palindromes_arr
end

p palindromes("guillaumezeiourzoierauoepruzeonajzfnzjkeajaaaaaozeirzeriozeorezo")









#
#
#
