Input: k = 2, prices = [3,2,6,5,0,3]
Output: 7
Explanation: Buy on day 2 (price = 2) and sell on day 3 (price = 6), profit = 6-2 = 4. Then buy on day 5 (price = 0) and sell on day 6 (price = 3), profit = 3-0 = 3.
  
# @param {Integer} k
# @param {Integer[]} prices
# @return {Integer}
def max_profit(k, prices)
  return 0 if (k <=0 || prices.size <= 0)

  n = prices.size
    
  if 2*k > n
    res = 0
    (1..(n-1)).each do |i|
      res += [0, prices[i] - prices[i-1]].max
    end
    
    return res
  end

  dp = Array.new(n) { Array.new(k+1) { Array.new(2) { -Float::INFINITY } } }

  dp[0][0][0] = 0
  dp[0][1][1] = -prices[0]

  (1..(n-1)).each do |i|
    (0..k).each do |j|
      # sell or not holding
      dp[i][j][0] = [dp[i-1][j][0], dp[i-1][j][1] + prices[i]].max
      
      if j > 0
        # buy or keep holding
        dp[i][j][1] = [dp[i-1][j][1], dp[i-1][j-1][0] - prices[i]].max
      end
    end
  end

  res = 0
  
  (0..k).each do |j|
     res = [res, dp[n-1][j][0]].max
  end

  res
end
