def make_change(value, coins = [25, 10, 5, 1])
  return [] if value == 0
  arr = []
  coin = coins.shift

  (value / coin).times { arr << coin }

  arr + make_change(value % coin, coins)
end

def make_change2(value, coins = [25, 10, 5, 1])
  return [] if value == 0
  num_coins = value / coins.first

  if num_coins > 0
    [coins.first] + make_change2(value - coins.first, coins)
  else
    make_change2(value, coins[1..-1])
  end
end

def make_change3(value, coins = [25, 10, 5, 1])
  return [] if value == 0
  current_best = Array.new(value, coins.last)

  coins.each do |coin|
    if coin <= value
      result = (make_change3(value - coin, coins).unshift(coin))
      current_best = result if result.length < current_best.length
    end
  end
  current_best
end
