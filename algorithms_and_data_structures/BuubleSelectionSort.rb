# O(n^2) memory: O(1)
def bubble_sort(array)
  last_index = array.length - 1
  for i in 0..last_index do
    second_bound = last_index - i - 1
    for j in 0..second_bound do
        if array[j] > array[j+1]
          temp = array[j]
          array[j] = array[j+1]
          array[j+1] = temp
        end
    end
  end
end

# runtime O(n^2) memory: O(1)
def selection_sort(array)
  last_index = array.length - 1
  for i in 0..last_index
    max_index = max_element(array, last_index-i)
    temp = array[last_index - i]
    array[last_index - i] = array[max_index]
    array[max_index] = temp
  end
end

def max_element(array, right)
  max_index = 0
  for i in 1..right
    max_index = i if array[max_index] < array[i]
  end
  max_index
end


my_array = [2, 12, 20, -1, 290, 39, 57, 123, 213]

selection_sort(my_array)

puts my_array.to_s
