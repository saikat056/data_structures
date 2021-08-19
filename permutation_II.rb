# @param {Integer[]} nums
# @return {Integer[][]}
def permute_unique(nums)
  return [] if nums.empty?
  
  cal_per(0, nums).uniq
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
