require 'bitarray'

# we assume ASCII
def print_duplicate_chars(word)
  bit_array = BitArray.new(128)
  printed = []

  word.each_char do |c|
    index = c.ord % 128
    if bit_array[index] == 1
      unless printed.include?(c)
        puts c
        printed << c
      end
    else
      bit_array[index] = 1
    end
  end
end

def duplicate_count(word)
  hash_map = {}

  word.each_char do |c|
    hash_map[c] = 0 if !hash_map.has_key?(c)
    hash_map[c] += 1
  end

  hash_map.each { |key, value| puts key if value > 1}

end


my_string = 'witaam bbardzoo seerdecznie'

print_duplicate_chars(my_string)
puts '------'
duplicate_count(my_string)