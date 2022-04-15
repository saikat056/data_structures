# O(n^2) time
def max_sub_array(nums)
  return nums.first if nums.count==1
  num_hash = {}
  sum = 0
  nums.each_with_index do |x, index|
    sum += x
    num_hash[index] = sum
  end

  max_value = -100000
  x,y = 0, 0
  (0..(nums.count-1)).each do |i|
    (i..(nums.count-1)).each do |j|
      current_sum = i==0 ? num_hash[j] : (num_hash[j] - num_hash[i-1])
      if current_sum > max_value
        max_value = current_sum
        x,y = i, j
      end
    end
  end
  return max_value
end

# O(n lg n) time
def max_sub_array(nums)
  max_sub_array_recur(nums, 0, nums.count-1)
end

def max_sub_array_crossing(nums, left, m, right)
  left_max_sum = right_max_sum =  -10000000
  sum = 0
  (left..m).reverse_each do |index|
    sum += nums[index]
    left_max_sum = sum if sum > left_max_sum
  end

  sum = 0
  (m+1..right).each do |index|
    sum += nums[index]
    right_max_sum = sum if sum > right_max_sum
  end

  return left_max_sum + right_max_sum
end

def max_sub_array_recur(nums, left, right)
  return nums[left] if left == right
  mid = (left + right)/2
  [max_sub_array_recur(nums, left, mid), 
   max_sub_array_recur(nums,mid+1,right), 
   max_sub_array_crossing(nums, left, mid, right)].max
end


# O(n) solution - kadane algo
def max_sub_array(nums)
  max_so_far = -123124324324
  ending_max = 0
  nums.each do |num|
    ending_max += num
    max_so_far = ending_max if max_so_far < ending_max  
    ending_max = 0 if ending_max < 0
  end
  max_so_far
end

# O(n) solution - kadane algo
def max_sub_array(nums)
  max_so_far = ending_max = nums.first
  (1..nums.count-1).each do |index|
    ending_max = [nums[index], ending_max + nums[index]].max
    max_so_far = ending_max if max_so_far < ending_max  
  end
  max_so_far
end
