# helper method of the array length
# O(n log n) memory: depends
  # if left < right
  # array, helper_a, 0, middle
  # arrat, helper_a, middle+1, right
  # merge array, helper_a, left, middle, right

  # merge
  # copy from left to right including to helper array
  # while left_helper <= middle and helper_rught <= right
  # remaining = middle - helper_left
  # for i in 0..remaming array[current+i] = helper_array[helper_left + i]


def merge_sort_simple(array)
  helper_array = Array.new(array.length)
  merge_sort(array, helper_array, 0, array.length - 1)
end


def merge_sort(my_array, helper_array, left, right)
  if left < right
    middle = (left + right) / 2
    merge_sort(my_array, helper_array, 0, middle)
    merge_sort(my_array, helper_array, middle+1, right)
    merge(my_array, helper_array, left, middle, right)
  end
end

def merge(array, helper_array, left, middle, right)
  helper_array = Array.new(array.length)
  # copy both halves into a helper array
  for i in left..right do
    helper_array[i] = array[i]
  end

  helper_left = left
  helper_right = middle + 1
  current = left

  # iterate through helper array, compare the left
  # and righ half, copying back
  # the smaller element from the two halves
  # into the original array
  while helper_left <= middle && helper_right <= right do
    if helper_array[helper_left] <= helper_array[helper_right]
      array[current] = helper_array[helper_left]
      helper_left += 1
    else
      array[current] = helper_array[helper_right]
      helper_right += 1
    end
    current += 1
  end


  # copy the rest of the left side of the array into the target array
  remaining = middle - helper_left
  for i in 0..remaining do
    array[current + i] = helper_array[helper_left + i]
  end
end


my_array = [2, 12, 20, -1, 290, 39, 57, 123, 213]

merge_sort_simple(my_array)

puts my_array.to_s
