
#Given an array of positive integers nums, remove the smallest subarray (possibly empty) such that the sum of the remaining elements is divisible by p. It is not allowed to remove the whole array.

#Return the length of the smallest subarray that you need to remove, or -1 if it's impossible.

#A subarray is defined as a contiguous block of elements in the array.

Input: nums = [6,3,5,2], p = 9
Output: 2
Explanation: We cannot remove a single element to get a sum divisible by 9. The best way is to remove the subarray [5,2], leaving us with [6,3] with sum 9.

sum = 9+5+2 = 16
sum%9 = 16 - 9 = 7
find out the smallest subarray of sum%7

def min_subarray(nums, p)
  need = 0
  # O(n), where n == nums.size
  nums.each{ |x| need = (need + x)%p }
  
  return 0 if need == 0
  
  sum = 0
  hash = {}
  a_size = nums.size
  hash[0] = -1
  
  # O(n), where n == nums.size
  (0..(nums.size - 1)).each do |i|
    sum = (sum + nums[i])%p
    search = (sum - need)%p
    
    search += p if search < 0
    
    a_size = [a_size, (i - hash[search])].min   if hash[search]
    
    hash[sum] = i
  end
  
  a_size == nums.size ? -1 : a_size
end

Time
----
n = nums.size
T=O(n)


