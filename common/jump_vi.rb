[10,-5,-2,4,0,3]
3

nums = [1,-5,-20,4,-1,3,-6,-3]
k = 2


def max_result(nums, k)
  return nums[0] if nums.size == 0
  
  n  = nums.size
  dp = Array.new(n) { -Float::INFINITY }
  dp[0] = nums[0]
  
  (0..(n-1)).each do |i|
    (1..k).each do |j|
      break if i+j >= n
      
      dp[i+j] = [dp[i+j], dp[i] + nums[i+j]].max  
    end
  end
    
  dp[-1]
end

Time

T = O(n*k)
