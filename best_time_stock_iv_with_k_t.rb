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
              
  dp = Array.new(n) { 0 }

  k.times do
    val = 0
    
    (1..(n-1)).each do |i|
       val = [dp[i], val + prices[i] - prices[i-1]].max
       dp[i] = [dp[i-1], val].max
    end
  end
  
  dp[-1]
end
