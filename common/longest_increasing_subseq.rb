
Input: nums = [10,9,2,5,3,7,101,18]
Output: 4
Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
  
nums = [10, 9, 2, 5, 3, 7,101, 18]
         0. 1  2  3  4  5   6  7

def length_of_lis(nums)
  dp = Array.new(nums.size) { 1 } 
  
  (1..(nums.size - 1)).each do |i|
    count = -Float::INFINITY
    
    (0..(i-1)).each do |j|
      if nums[i] > nums[j]
        count= [count, dp[j] + 1].max
      end
    end
    
    dp[i] = [dp[i], count].max
  end
  
  dp.max
end
