def merge_sort(arr)
  if arr.length == 1
    return arr
  else
    merge(merge_sort(arr[0..arr.length/2-1]), merge_sort(arr[arr.length/2..-1]))
  end
end

def merge(arr1, arr2)
  merged_arr = []

  until arr1.empty? || arr2.empty?
    if arr1[0] < arr2[0]
      merged_arr << arr1.shift
    else
      merged_arr << arr2.shift
    end
  end

  merged_arr += arr1 if arr2.empty?
  merged_arr += arr2 if arr1.empty?

  merged_arr
end

def subsets(arr)
  if arr.length == 0
    [[]]
  elsif arr.length == 1
    [[], [arr[0]]]
  else
    previous = subsets(arr[0..-2])
    mapped = deep_dup(previous)
    mapped.each { |el| el << arr.last }
    previous + mapped
  end
end

def deep_dup(arr)
  new_arr = []

  arr.each do |el|
    if el.is_a?(String)
      new_arr << String.new(el)
    elsif el.is_a?(Array)
      new_arr << deep_dup(el)
    else
      new_arr << el
    end
  end

  new_arr
end
