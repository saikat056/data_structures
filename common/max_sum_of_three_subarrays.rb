Input: nums = [1,2,1,2,6,7,5,1], k = 2
Output: [0,3,5]

nums = [7,13,20,19,19,2,10,1,1,19]
k = 3

nums = [4,5,10,6,11,17,4,11,1,3]
k = 1

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def max_sum_of_three_subarrays(nums, k)
  n = nums.size
  
  sum = Array.new(n) { 0 }
  
  sum[0] = nums[0]
  
  (1..(n-1)).each do |i|
    sum[i] = sum[i-1] + nums[i]
  end
  
  left_pos = Array.new(n) { -1 }
  total = -Float::INFINITY
  
  (k..(n-1)).each do |i|
    temp = ((i-k-1) < 0) ? 0 : sum[i-k-1]
      
    if (sum[i-1] - temp) > total
      left_pos[i] = i-k
      total = sum[i-1] - temp
    else
      left_pos[i] = left_pos[i-1]
    end
  end
  
  right_pos = Array.new(n) { -1 }
  total = -Float::INFINITY
  (0..(n-1-k)).reverse_each do |i|
    if (sum[i+k] - sum[i]) >= total
      right_pos[i] = i + 1
      total = sum[i+k] - sum[i]
    else
      right_pos[i] = right_pos[i+1]
    end
  end
  
  max = -Float::INFINITY
  arr = [-1]*3
  
  (k..(n-(2*k))).each do |i|
    j = i + k - 1
    l = left_pos[i]
    r = right_pos[j]
    
    curr = (sum[j] - sum[i-1]) + (sum[l+k-1] - sum[l-1]) + (sum[r+k-1] - sum[r-1])
    
    if curr > max
      max = curr
      arr[0] = l
      arr[1] = i
      arr[2] = r
    end
  end
  
  arr
end
