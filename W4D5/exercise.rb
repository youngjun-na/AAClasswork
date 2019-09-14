def my_min(arr)
  arr.each_with_index do |el, i|
    mini = true
    arr.each_with_index do |el1, j|
      next if i == j
      mini = false if el > el1
    end

    return el if mini == true
  end
end

arr = [0, 3, 5, 4, -5, 10, 1, 90]

# p my_min(arr)

def my_better_min(arr)
  smallest = arr.first

  arr.each do |el|
    smallest = el if el < smallest
  end

  smallest
end

p my_better_min(arr)

def largest_contiguous_subsum(array)
  new_arr = []
  array.each_with_index do |el, i|
    array.each_with_index do |el1, j|
      if i <= j
        new_arr << array[i..j]
      end
    end
  end

  new_arr.map! do |sub|
    sub.sum  
  end

  new_arr.max
end

# p largest_contiguous_subsum(list)

def better_subsum(array)
  running = array.first
  sum = array.first

  (1...array.length).each do |el|
    el = array[el]
    
    if sum <= 0
      sum = 0 if el > sum
    end
    
    sum += el
    running = sum if sum > running
  end
  running
end

list = [-5, -1, -3]
list2 = [2, 3, -6, 7, -6, 7]
list3 = [5, 3, -7]

# p better_subsum(list)
# p better_subsum(list2)
# p better_subsum(list3)
