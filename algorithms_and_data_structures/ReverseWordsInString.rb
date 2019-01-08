
def reverse_word(my_string)
  word_length = my_string.length
  string_array = my_string.split('')
  first_index = 0
  last_index = my_string.length - 1
  while(first_index < last_index)
    temp = string_array[first_index]
    string_array[first_index] = string_array[last_index]
    string_array[last_index] = temp
    first_index += 1
    last_index -= 1
  end
  string_array.join('').to_s
end


my_string = 'witam serdecznie'

my_string_reversed = 'einzcedres matiw'

puts  reverse_word(my_string) == my_string_reversed