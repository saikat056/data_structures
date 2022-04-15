Input: nums = [0,0,1,1,1,2,2,3,3,4]
Output: 5, nums = [0,1,2,3,4,_,_,_,_,_]
Explanation: Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
  
def remove_duplicates(nums)
  return nums.size if nums.size <= 1
 
  i = 0
  j = 1

  # O(n) where n is the size of nums
  while j < nums.size do
    while (nums[j-1] == nums[j]) && (j < nums.size) do
      j += 1
    end
    
    nums[i] = nums[j-1]
    i += 1
    j += 1 if j < nums.size
  end

  if nums[i-1] != nums[j-1]
    nums[i] = nums[j-1]
    i += 1
  end

  i
end

Time complexity
----------------
n = size of nums
T = O(n)

Test
###
nums = []
nums = [1]

###
nums = [0, 0, 0, 0]
i = 1
j = 4

###
Input: nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
               0  1  2  3  4  5  6  7  8  9
       nums =  0  1  2  3  4

 i = 5
 j = 10
 nums.size = 10
