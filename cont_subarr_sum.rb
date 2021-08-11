
Input: nums = [23,2,4,6,7], k = 6
Output: true
Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
  
def check_subarray_sum(nums, k)
  hash = {}
  sum = 0
  hash[0] = -1

  # O(n)
  (0..(nums.size - 1)).each do |i|
    sum += nums[i]
    
    if hash[sum%k].nil?
      hash[sum%k] = i
    else
      return true if (i - hash[sum%k]) >= 2
    end
  end

  false
end

Time complexity
---------------
n = nums.size
T = O(n)

Test
----
nums = [23,2,4,6,7], k = 6
sum = 29
i = 2
25%6 = 25 - 24 = 1
29%6 = 29 - 24 = 5
hash[5] = 0
hash[1] = 1

case-2
nums=[]
  
case-3
nums=[6]
