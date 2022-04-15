def max_profit(prices)
  min_value = prices.first
  global_diff = 0
  (1..prices.count-1).each do |index|
    current_diff = prices[index] - min_value
    global_diff = current_diff if current_diff > global_diff
    min_value = prices[index] if prices[index] < min_value
  end
  global_diff
end
