def top_k_frequent(nums, k)
  hash = Hash.new(0)
  nums.each{|num| hash[num] += 1}
  hash.keys.sort_by{|key| -hash[key]}.first(k)
end
