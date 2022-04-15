# Permutation

Input: nums = [1,2,3]
Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

Input: nums = [1]
Output: [[1]]

def permute(nums)
  return [] if nums.empty?
  
  cal_per(0, nums)
end

def cal_per(i, nums)
  return [[nums[i]]] if i == nums.size - 1
  
  arr = cal_per(i + 1, nums)
  ret = []
  
  #O(arr.size) times iterations
  arr.each do |a|
    temp = [nums[i]] + a
    ret << temp.dup   # O(temp.size)
    
    # O(temp.size) times iteration
    (1..(temp.size - 1)).each do |i|
      temp[i], temp[i-1] = [temp[i-1], temp[i]]
      ret << temp.dup # O(temp.size)
    end
  end
  
  ret
end

Time
----
  T = 1 + 1*2 + 1*2*3 + 1*2*3*4
  n = nums.size
  T = 1 + 2! + 3! + ... + n!
    <= n! + n! + n! + ... + n! = n*n!
  

  O(n!) <= T <= O(n*n!)
  T is tighter than O(n*n!) but less tighter than O(n!)
  
  T = O(n*n!)

Space
-----
  In the worst case, a recursive call may need to store n! solutions
  S = 1 + 2! + 3! + ... + n! solutions stored
    = O(n*n!)
  S = O(n*n!)
    
Test
----
nums = [1,  2,  3]
        0   1   2

i = 0,
  arr = [[2,3], [3,2]]
  num[i] = 1
  ret = [[1,2,3],[2,1,3], [2,3,1], [1,3,2], [3,1,2], [3,2,1]]
i = 1,
  arr = [3]
  ret = [[2,3], [3,2]]

i = 2, return [3]
