
Input: nums = [4,5,0,-2,-3,1], k = 5
Output: 7
Explanation: There are 7 subarrays with a sum divisible by k = 5:
[4, 5, 0, -2, -3, 1], [5], [5, 0], [5, 0, -2, -3], [0], [0, -2, -3], [-2, -3]


def subarrays_div_by_k(nums, k)
  hash= {}
  sum = 0
  hash[0] = 1
  count = 0
  
  # O(n), where n == nums.size
  (0..(nums.size - 1)).each do |i|
    sum += nums[i]
    
    # O(1), constant time
    if hash[sum%k].nil?
      hash[sum%k] = 1
    else
      count += hash[sum%k]
      hash[sum%k] += 1
    end
  end
  
  count
end

Time complexity
===============
n = nums.size
T = O(n)

Test
---- 
  i:    0  1  2   3   4  5
nums = [4, 5, 0, -2, -3, 1], k = 5
i = 5
sum = 1
4%5 = 4
9%5 = 4
7%5 = 2
4%5 = 4
5%5 = 0
hash[0] = 1
hash[4] = 4
hash[2] = 1
count = 1 + 2 + 3 + 1 = 7
