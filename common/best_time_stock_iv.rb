# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  return 0 if prices.size <= 1
  
  l_pro = Array.new(prices.size) { 0 }
  min = Float::INFINITY
  max_p = -Float::INFINITY
  
  (0..(prices.size-1)).each do |i|
    min = [min, prices[i]].min
    max_p = [max_p, (prices[i] - min)].max if prices[i] >= min
    l_pro[i] = max_p
  end
  
  r_pro = Array.new(prices.size) { 0 }
  max = -Float::INFINITY
  max_p = -Float::INFINITY
  
  (0..(prices.size-1)).reverse_each do |i|
    max = [max, prices[i]].max
    max_p = [max_p, (max - prices[i])].max if prices[i] <= max
    r_pro[i] = max_p
  end
  
  profit = -Float::INFINITY
  
  (0..(prices.size-2)).each do |i|
    profit = [profit, l_pro[i] + r_pro[i+1]].max
  end
  
  profit = [profit, r_pro[0]].max
  
  profit
end
