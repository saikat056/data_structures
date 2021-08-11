Input: nums = [1,1,1], k = 2
Output: 2

Input: nums = [1,2,3], k = 3
Output: 2

Input: nums = [1, 2, -3, 2, 1, 3], k = 3
Output: 5
  [1,2], [1,2,-3,2,1], [2,1], [3], [-3,2,1,3]


def subarray_sum(nums, k)
  hash = {}
  sum = 0
  count = 0
  
  hash[0] = 1
  
  # O(n)
  (0..(nums.size - 1)).each do |i|
    sum += nums[i]
    
    count += hash[sum - k] if hash[sum - k]
    
    hash[sum] = hash[sum] ? (hash[sum] + 1) : 1
  end
  
  count
end

Time complexity
---------------
n = nums.size
T = O(n)

Test
----
   i    0  1   2  3  4  5
nums = [1, 2, -3, 2, 1, 3], k = 3
sum = 6
i = 5
count = 5
hash[1] = 1
hash[3] = 2
hash[0] = 2
hash[2] = 1

