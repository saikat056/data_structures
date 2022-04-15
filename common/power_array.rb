# Given an integer array nums of unique elements, return all possible subsets (the power set).

Input: nums = [1,2,3]
Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  sub(nums, 0)
end

def sub(nums, i)
  return [[]] if i == nums.size
  
  arr = sub(nums, i + 1)
  result = arr.dup
  
  arr.each do |a|
    result << [nums[i]] + a
  end
  
  result
end

Time
----
1: []  
2: [[],3]
4: [[],[3],[2],[2,3]]
8: [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]

T = n*(1 + 2 + 4 + 8 = 1+2+3+...+2^n) = O(n*2^n)
n = size of nums

Space
-----
S = O(n)
Each recursive call holds O(1) memory to store the state

  
Test
----
nums = []  

Test
----    0  1  2
nums = [1, 2, 3]
i = 0

i = 2
arr = [[]]
result = [[],[3]]
