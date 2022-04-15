Input: nums = [-1,1,0,-3,3]
Output: [0,0,9,0,0]

Input: nums =  [1, 2, 3,  4]
       l_arr = [1, 2, 6, 24]
       r_arr = [24, 24,  12,  4]
Output: [24,12,8,6]

def product_except_self(nums)  
  l_arr = Array.new(nums.size) { 0 }
  r_arr = Array.new(nums.size) { 0 }
  
  # O(n)
  l_arr[0] = nums[0]
  (1..(nums.size - 1)).each do |i|
    l_arr[i] = l_arr[i-1] * nums[i]
  end
  
  # O(n)
  r_arr[-1] = nums[-1]
  (0..(nums.size - 2)).reverse_each do |i|
    r_arr[i] = r_arr[i+1] * nums[i]
  end
  
  # O(n)
  result = Array.new(nums.size) { 1 }
  (0..(result.size - 1)).each do |i|
    result[i] *= l_arr[i-1] if i-1 >= 0
    result[i] *= r_arr[i+1] if i+1 < nums.size
  end
  
  result
end

Time complexity
---------------
  n = nums.size
  T = O(n)

Test
----
Input: nums =  [1,   2,   3,  4]
       l_arr = [1,   2,   6, 24]
       r_arr = [24, 24,  12,  4]
Output:        [24, 12,   8,  6]
