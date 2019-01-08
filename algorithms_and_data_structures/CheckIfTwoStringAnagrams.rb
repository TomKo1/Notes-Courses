require 'bitarray'

# How do you check if two strings are anagrams of each other?
def check_if_anagrams(first_string, second_string)
  occurences_hash = {}
  anagrams? = true

  first_string.each_char do |c|
    occurences_hash[c] = 0  unless occurences_hash.has_key?(c)
    occurences_hash[c] += 1
  end

  second_string.each_char do |c|
    unless occurences_hash.has_key?(c)
      anagrams? = false
      break
    end
    occurences_hash[c] -= 1
  end

  occurences_hash.each do |key, value|
    if value > 0
      anagrams? = false
      break
    end
  end

  anagrams?
end

first_string =