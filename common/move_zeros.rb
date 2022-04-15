
Input: nums = [0,1,0,3,12]
Output: [1,3,12,0,0]

def move_zeroes(nums)
  zero_p = non_p = 0
  n = nums.size
  
  while (zero_p < n && non_p < n) do
    
    while(nums[zero_p] != 0 && zero_p < n) do
      zero_p += 1
    end
    return if zero_p == n
    
    while((nums[non_p] == 0 && non_p < n) || (non_p <= zero_p)) do
      non_p += 1
    end
    return if non_p == n
    
    nums[zero_p], nums[non_p] = [nums[non_p], nums[zero_p]]
  end
end

Time Complexity
---------------
n = nums.size
T = O(n)

Test
----
        0   1   2   3   4 
nums = [1,  3,  12,  0,  0]
zero_p = 3
non_p  = 4
