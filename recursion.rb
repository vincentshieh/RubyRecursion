def range(start, finish)
  if finish < start
    return []
  else
    range(start, finish - 1) << finish
  end
end

def sum_recursive(arr)
  if arr.size == 1
    arr[0]
  else
    arr.pop + sum_recursive(arr)
  end
end

def sum_iterative(arr)
  total = 0
  arr.each do |el|
    total += el
  end

  total
end

def exp1(base, exponent)
  if exponent == 0
    1
  else
    base * exp1(base, exponent - 1)
  end
end

def exp2(base, exponent)
  if exponent == 0
    1
  elsif exponent == 1
    base
  elsif exponent.even?
    exp2(base, exponent / 2) * exp2(base, exponent / 2)
  elsif exponent.odd?
    base * exp2(base, (exponent - 1) / 2) * exp2(base, (exponent - 1) / 2)
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

def fibonacci_recursive(num)
  if num == 1
    [1]
  elsif num == 2
    [1, 1]
  else
    previous = fibonacci(num - 1)
    previous << previous[-1] + previous[-2]
  end
end

def fibonacci_iterative(num)
  arr = [1, 1]
  while arr.length < num
    arr << arr[-1] + arr[-2]
  end
  arr
end

def binary_search(arr, target)
  return nil if arr == [] || (arr.length == 1 && arr[0] != target)

  current_position = arr.length / 2

  if arr[current_position] == target
    current_position
  elsif arr[current_position] > target
    binary_search(arr[0..current_position - 1], target)
  else
    result = binary_search(arr[current_position + 1..-1], target)
    return nil if result.nil?
    current_position + 1 + result
  end
end
