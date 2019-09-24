def three_sum(nums)
  nums.sort!
  arr = []
  sum_hash ={}
  value_used_hash ={}
  (0..nums.count-3).each do |current|
    next if value_used_hash[nums[current]]
    start = current + 1
    finish = nums.count-1
    while(start < finish)
      a = nums[start]
      b = nums[finish]
      sum = nums[current] + a + b
      if sum == 0
        signature = [nums[current], nums[start], nums[finish]].join(',')
        if !sum_hash[signature]
          arr.push([nums[current], nums[start], nums[finish]])
          sum_hash[signature] = true
        end
        start += 1 while nums[start] == a
        finish -= 1 while nums[finish] == b
      elsif sum < 0
        start += 1 while nums[start] == a
      else
        finish -= 1 while nums[finish] == b
      end
    end
    value_used_hash[nums[current]] = true
  end
  arr
end
