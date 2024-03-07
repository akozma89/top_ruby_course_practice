# frozen_string_literal: true

def bubble_sort(input_array = [], remaining = input_array.length)
  return input_array if remaining == 1

  changed = false

  input_array.each_with_index do |item, index|
    if index < input_array.size - 1 && item > input_array[index + 1]
      input_array[index], input_array[index + 1] = input_array[index + 1], input_array[index]
      changed = true
    end
  end

  return input_array unless changed

  bubble_sort(input_array, remaining - 1)
end

puts bubble_sort([4, 3, 78, 2, 0, 2]).join(',')

# bubble_sort([4,3,78,2,0,2])
# [0,2,2,3,4,78]
